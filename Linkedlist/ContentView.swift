//
//  ContentView.swift
//  Linkedlist
//
//  Created by Roopesh Tripathi on 21/04/24.
//

import SwiftUI

// Represents a single node in the linked list
class ListNode<T: Equatable> {
    var value: T
    var next: ListNode?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

// Represents the entire linked list
class LinkedList<T: Equatable> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    func append(value: T) {
        let newNode = ListNode(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
}

// SwiftUI representation of a single node in the linked list
struct ListNodeView<T>: View {
    let value: T
    
    var body: some View {
        VStack {
            HStack {
                Text("\(value)")
                    .font(.headline)
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct LinkedListView<T: Equatable>: View {
    let linkedList: LinkedList<T>
    
    var body: some View {
        HStack {
            ForEach(values().indices, id: \.self) { index in
                ListNodeView(value: values()[index])
            }
        }
    }
    
    func values() -> [T] {
        var result: [T] = []
        var currentNode = linkedList.head
        while let node = currentNode {
            result.append(node.value)
            currentNode = node.next
        }
        return result
    }
}


struct ContentView: View {
    let linkedList = LinkedList<Int>()
    let linkedList1 = LinkedList<String>()
    let linkedList2 = LinkedList<String>()

    init() {
        linkedList.append(value: 1)
        linkedList.append(value: 2)
        linkedList.append(value: 3)
        linkedList.append(value: 4)
        linkedList.append(value: 5)
        linkedList.append(value: 6)
        linkedList.append(value: 7)
        
        linkedList1.append(value: "R")
        linkedList1.append(value: "O")
        linkedList1.append(value: "O")
        linkedList1.append(value: "P")
        linkedList1.append(value: "E")
        linkedList1.append(value: "S")
        linkedList1.append(value: "H")
        
        linkedList2.append(value: "T")
        linkedList2.append(value: "R")
        linkedList2.append(value: "I")
        linkedList2.append(value: "P")
        linkedList2.append(value: "A")
        linkedList2.append(value: "T")
        linkedList2.append(value: "H")
        linkedList2.append(value: "I")
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .center) {
                LinkedListView(linkedList: linkedList)
                LinkedListView(linkedList: linkedList1)
                LinkedListView(linkedList: linkedList2)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
