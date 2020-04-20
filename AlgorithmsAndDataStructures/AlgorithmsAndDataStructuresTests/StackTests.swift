//
//  StackTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by ksmirnov on 19.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

final class StackTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStack() {
        var stack: Stack<Int> = Stack()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        print("Stack(3 push): \(stack)")
        stack.pop()
        stack.pop()
        print("Stack(2 pop): \(stack)")
        stack.push(4)
        print("Stack(1 push): \(stack)")
        
        XCTAssert(stack.count == 2, "wrong behaviour in stack work (count is not correct)")
        XCTAssert(stack.top == 4, "wrong behaviour in stack work (top is not correct)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
