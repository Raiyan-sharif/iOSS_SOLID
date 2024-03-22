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

    var description: String{
        return root.description
    }

    func clear(){
        root = HtmlElement(name: rootName, text: "")
    }
}


func main(){

    let builder = HtmlBuilder(rootName: "ul")
    builder.addChild(name: "li", text: "hello")
    builder.addChild(name: "li", text: "world")
    print(builder)

}

main()
