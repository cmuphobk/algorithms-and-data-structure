//
//  BinaryTreeTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by ksmirnov on 19.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

protocol Arithmetic {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
}

extension Double: Arithmetic {}

enum Operators: String {
    case addition = "+"
    case substruction = "-"
    case multiplication = "*"
    case division = "/"
    
    func process<T: Arithmetic>(leftValue: T, rightValue: T) -> T {
        switch self {
        case .addition:
            return leftValue + rightValue
        case .substruction:
            return leftValue - rightValue
        case .multiplication:
            return leftValue * rightValue
        case .division:
            return leftValue / rightValue
        }
    }
}

final class BinaryTreeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBinaryTree() {
        
        let oneNode = BinaryTree.node(.empty, "1", .empty)
        let twoNode = BinaryTree.node(.empty, "2", .empty)
        let threeNode = BinaryTree.node(.empty, "3", .empty)
        let fourNode = BinaryTree.node(.empty, "4", .empty)
        
        let leftNode = BinaryTree.node(oneNode, Operators.addition.rawValue, twoNode)
        let rightNode = BinaryTree.node(threeNode, Operators.division.rawValue, fourNode)
        
        let rootNode = BinaryTree.node(leftNode, Operators.addition.rawValue, rightNode)
        
        func traverseInOrder<T>(_ node: BinaryTree<T>) {
            print("===========Start traverseInOrder===========")
            node.traverseInOrder { (value) in
                print("Process value: \(value)")
            }
            print("===========End traverseInOrder===========")
        }
        traverseInOrder(rootNode)
        
        func traversePreOrder<T>(_ node: BinaryTree<T>) {
            print("===========Start traversePreOrder===========")
            node.traversePreOrder { (value) in
                print("Process value: \(value)")
            }
            print("===========End traversePreOrder===========")
        }
        traversePreOrder(rootNode)
        
        print("===========Start traversePostOrder (Arphmentic with BinaryTree and Stack)===========")
        var stack: Stack<Double> = Stack()
        rootNode.traversePostOrder { (value) in
            if let doubleValue = Double(value) {
                stack.push(doubleValue)
                print("Process value: \(doubleValue)")
            } else if let operatorValue = Operators(rawValue: value), !stack.isEmpty {
                let rightValue: Double = stack.pop() ?? 0
                let leftValue: Double = stack.pop() ?? 0
                let result = operatorValue.process(leftValue: leftValue, rightValue: rightValue)
                stack.push(result)
                print("Process value: \(operatorValue.rawValue)")
            } else {
                print("can't parse value: \(value)")
            }
            print("Stack in process: \(stack)")
        }
        print("===========End traversePostOrder (Arphmentic with BinaryTree and Stack)===========")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
