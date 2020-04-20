//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by ksmirnov on 14.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import Foundation

// MARK: - LinkedListNode

class LinkedListNode<T> {
    var value: T
    
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

// MARK: - LinkedList

class LinkedList<T> {
    
    var head: LinkedListNode<T>?
    var first: LinkedListNode<T>?
    
    var startIndex: Index {
        return 0
    }
    var endIndex: Index = 0
    // TROUBLE: - Computing endIndex and count. As alternative variant: saving count in stored property (after insert, append, remove).
    //    var endIndex: Int {
    //        var node = first
    //        guard node != nil else { return startIndex }
    //        var count = startIndex
    //        while node?.next != nil {
    //            count = count.advanced(by: 1)
    //            node = node?.next
    //        }
    //        return count.advanced(by: 1)
    //    }
    
    func append(_ element: T) {
        let node = LinkedListNode(value: element)
        if let head = head {
            node.previous = head
            head.next = node
            self.head = node
        } else {
            first = node
            head = node
        }
        endIndex = endIndex.advanced(by: 1)
    }
    
    @discardableResult
    func remove(at index: Index) -> LinkedListNode<T>? {
        guard index < count else {
            fatalError("\(#function), position more than count")
        }
        let nodeForRemove = node(at: index)
        let previous = nodeForRemove?.previous
        let next = nodeForRemove?.next
        
        previous?.next = next
        next?.previous = previous
        
        if index == startIndex {
            first = next
        }
        
        if index == endIndex {
            head = previous
        }
        endIndex = endIndex.advanced(by: -1)
        return nodeForRemove
    }
    
    private func node(at index: Index) -> LinkedListNode<T>? {
        guard index < count else {
            fatalError("\(#function), position more than count")
        }
        guard index < count else { return nil }
        guard index != startIndex else { return first }
        
        var currentNode = first
        for _ in startIndex..<index {
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    private func insert(_ element: T, at index: Index) {
        guard index < count else {
            fatalError("\(#function), position more than count")
        }
        let newNode = LinkedListNode(value: element)
        let nodeAtIndex = node(at: index)
        let previousNode = nodeAtIndex?.previous
        
        newNode.next = nodeAtIndex
        newNode.previous = previousNode
        
        previousNode?.next = newNode
        nodeAtIndex?.previous = newNode
        
        if index == 0 {
            first = newNode
        }
        endIndex = endIndex.advanced(by: 1)
    }
}

// MARK: - Sequence

extension LinkedList: Sequence {
    typealias Element = T
    
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(firstOfLnkedList: first)
    }
}

// MARK: - Collection

extension LinkedList: Collection {
    typealias Index = Int

    subscript(position: Index) -> T {
        get {
            guard let value = node(at: position)?.value else {
                fatalError("\(#function), value is nil")
            }
            return value
        }
        set {
            insert(newValue, at: position)
        }
    }

    func index(after i: Int) -> Int {
        return i.advanced(by: 1)
    }
}

// MARK: - CustomStringConvertible

extension LinkedList: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return "[ \(self.map { String(describing: $0) } .joined(separator: ", ")) ]"
    }
}

// MARK: - LinkedListIterator

struct LinkedListIterator<T>: IteratorProtocol {
    typealias Element = T
    
    private let firstOfLnkedList: LinkedListNode<T>?
    
    init(firstOfLnkedList: LinkedListNode<T>?) {
        self.firstOfLnkedList = firstOfLnkedList
    }
    
    private var currentNode: LinkedListNode<T>?
    mutating func next() -> T? {
        if let currentNode = currentNode {
            self.currentNode = currentNode.next
            return self.currentNode?.value
        }
        currentNode = firstOfLnkedList
        return currentNode?.value
    }
}
