//
//  Stack.swift
//  AlgorithmsAndDataStructures
//
//  Created by ksmirnov on 14.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import Foundation

// MARK: - StackProtocol

protocol StackProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    
    var top: Element? { get }
    
    mutating func push(_ element: Element)
    
    @discardableResult
    mutating func pop() -> Element?
}

// MARK: - Stack

struct Stack<T>: StackProtocol {
    typealias Element = T
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        return array.popLast()
    }
}

// MARK: - Sequence

extension Stack: Sequence {
    func makeIterator() -> StackIterator<T> {
        return StackIterator(stack: self)
    }
}

// MARK: - CustomStringConvertible

extension Stack: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return "[ \(self.map { String(describing: $0) } .joined(separator: ", ")) ]"
    }
}

// MARK: - StackIterator

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T
    
    private var stack: Stack<T>
    
    init(stack: Stack<T>) {
        self.stack = stack
    }
    
    mutating func next() -> T? {
        return stack.pop()
    }
}
