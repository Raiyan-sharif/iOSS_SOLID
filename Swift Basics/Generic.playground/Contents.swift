import Foundation

func getReverse<Element>(of arr: [Element]) -> [Element] {
    return arr.reversed()
}

let intString = ["1", "2", "3", "4"]
let reversedIntArr = getReverse(of: intString)
print(reversedIntArr) //prints [4, 3, 2, 1]

func getReverseArray<Element: Equatable>(_ arr: [Element], val: Element) -> [Element] {
    return (arr.reversed()).filter{ $0 != val}
}

let intArray = [1, 2, 3, 4]
let reverseArray = getReverseArray(intArray, val: 1)
print(reverseArray)

//
//class ListNode<NodeValue> {
//    private let value: NodeValue
//    var next: ListNode?
//
//    init(value: NodeValue) {
//        self.value = value
//        self.next = nil
//    }
//}
//
//extension ListNode {
//    func getValue() -> NodeValue {
//        return value
//    }
//}
//
//let intListNode2 = ListNode<Int>(value: 20)
//let nodeValue2 = intListNode2.getValue()
//print("Node value: \(nodeValue2)")


class ListNode<NodeValue>: Equatable where NodeValue: Equatable {
    private let value: NodeValue
    var next: ListNode?

    init(value: NodeValue) {
        self.value = value
        self.next = nil
    }

    static func == (lhs: ListNode<NodeValue>, rhs: ListNode<NodeValue>) -> Bool {
        return lhs.value == rhs.value
    }
}

let node1 = ListNode<Int>(value: 10)
let node2 = ListNode<Int>(value: 20)
if node1 == node2 {
        print("Equal")
} else {
        print("Not equal") // will print Not equal
}

extension ListNode where NodeValue: CustomStringConvertible {
    func printDescription() {
        print("ListNode: " + value.description)
    }
}

//We can now create instance and call the method “printDescription()”.
let intListNode1 = ListNode<Int>(value: 10)
intListNode1.printDescription() //prints “ListNode: 10”

