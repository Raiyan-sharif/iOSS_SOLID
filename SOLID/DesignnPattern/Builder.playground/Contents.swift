import UIKit

class HtmlElement: CustomStringConvertible
{
    var name = ""
    var text = ""
    var elements = [HtmlElement]()
    private let indexSize = 2

    init(){}
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }

    private func description(_ indent: Int) -> String{
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"

        if !text.isEmpty
        {
            result += String(repeating: " ", count: (indent+1))
            result += text
            result += "\n"
        }

        for e in elements{
            result += e.description(indent+1)
        }
        result += "\(i)</\(name)>\n"
        return result

    }
    public var description: String{
        return description(0)
    }
}

class HtmlBuilder: CustomStringConvertible{
    private let rootName: String
    var root = HtmlElement()

    init(rootName: String){
        self.rootName = rootName
        self.root.name = rootName
    }

    func addChild(name: String, text: String)
    {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
    }

    func addChildFluent(name: String, text: String) -> HtmlBuilder
    {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
        return self
    }

    var description: String{
        return root.description
    }

    func clear(){
        root = HtmlElement(name: rootName, text: "")
    }
}

class Person: CustomStringConvertible
{
    // address
    var streetAddress = "", postcode = "", city = ""

    // employment
    var companyName = "", position = ""
    var annualIncome = 0

    var description: String
    {
        return "I live at \(streetAddress), \(postcode), \(city). " + "I work at \(companyName) as \(position) earning \(annualIncome)"
    }
}

class PersonBuilder
{
    var person = Person()
    var lives : PersonAddressBuilder
    {
        return PersonAddressBuilder(person)
    }
    var works: PersonJobBuilder
    {
        return PersonJobBuilder(person)
    }

    func build() -> Person
    {
        return person
    }

}

class PersonJobBuilder : PersonBuilder{
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }

    func at(_ companyName: String) -> PersonJobBuilder
    {
        person.companyName = companyName
        return self
    }

    func asA(_ position: String) -> PersonBuilder
    {
        person.position = position
        return self
    }

    func earning(_ annualIncome: Int) -> PersonBuilder
    {
        person.annualIncome = annualIncome
        return self
    }
}

class PersonAddressBuilder: PersonBuilder{

    internal init(_ person: Person)
    {
        super.init()
        self.person = person
    }

    func at(_ streetAddress: String) -> PersonAddressBuilder
    {
        person.streetAddress = streetAddress
        return self
    }

    func withPostcode(_ postcode: String) -> PersonAddressBuilder
    {
        person.postcode = postcode
        return self
    }

    func inCity(_ city: String) -> PersonAddressBuilder
    {
        person.city = city
        return self
    }

}

class Field : CustomStringConvertible
{
  var type: String = ""
  var name: String = ""
  init(called name: String, ofType type: String)
  {
    self.name = name
    self.type = type
  }
  public var description: String
  {
    return "var \(name): \(type)"
  }
}

class Class : CustomStringConvertible
{
  var name = ""
  var fields = [Field]()

  public var description: String
  {
    var s = ""
    s.append("class \(name)\n{\n")
    for f in fields
    {
      s.append("  \(f)\n")
    }
    s.append("}\n")
    return s
  }
}

class CodeBuilder : CustomStringConvertible
{
  private var theClass = Class()

  init(_ rootName: String)
  {
    theClass.name = rootName
  }

  func addField(called name: String, ofType type: String) -> CodeBuilder
  {
    theClass.fields.append(Field(called: name, ofType: type))
    return self
  }

  public var description: String
  {
    return theClass.description
  }
}

func main(){

//    let builder = HtmlBuilder(rootName: "ul")
//    builder.addChildFluent(name: "li", text: "hello")
//        .addChild(name: "li", text: "world")
//    print(builder)


    let pb = PersonBuilder()

    let p = pb.lives
        .at("123 London Road")
        .inCity("London")
        .withPostcode("SW12BC")
        .works.at("BJIT")
        .asA("SSE")
        .works.earning(123322)
        .build()
    print(p)

    var cb = CodeBuilder("Person").addField(called: "name", ofType: "String").addField(called: "age", ofType: "Int");
    print(cb.description);
}

main()
