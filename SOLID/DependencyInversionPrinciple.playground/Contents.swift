import UIKit

enum Relationship
{
    case parent
    case child
    case sibling
}

class Person
{
    var name = ""
    init(_ name: String = "") {
        self.name = name
    }
}

class Relationships
{
    var relations = [(Person, Relationship, Person)]()

}
