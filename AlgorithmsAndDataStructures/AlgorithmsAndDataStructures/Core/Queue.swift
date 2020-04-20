//
//  Queue.swift
//  AlgorithmsAndDataStructures
//
//  Created by ksmirnov on 14.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import Foundation

// MARK: - QueueProtocol

protocol QueueProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    
    var front: Element? { get }
    
    mutating func enqueue(_ el: Element)
    
    @discardableResult
    mutating func dequeue() -> Element?
}

// MARK: - Queue

struct Queue<T>: QueueProtocol {
    typealias Element = T
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var front: T? {
        return array.first
    }
    
    mutating func enqueue(_ el: T) {
        array.append(el)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.removeFirst()
    }
}

// MARK: - Sequence

extension Queue: Sequence {
    func makeIterator() -> QueueInterator<T> {
        return QueueInterator(queue: self)
    }
}

// MARK: - CustomStringConvertible

extension Queue: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return "[ \(self.map { String(describing: $0) } .joined(separator: ", ")) ]"
    }
}

// MARK: - QueueInterator

struct QueueInterator<T>: IteratorProtocol {
    typealias Element = T
    
    private var queue: Queue<T>
    
    init(queue: Queue<T>) {
        self.queue = queue
    }
    
    mutating func next() -> T? {
        return queue.dequeue()
    }
}
