//
//  LinkedListsTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by ksmirnov on 19.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

final class LinkedListsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLinkedList() {
        let linkedList: LinkedList<Int> = LinkedList()
        linkedList.append(1)
        print("LinkedList(1 append): \(linkedList)")
        linkedList.append(2)
        print("LinkedList(2 append): \(linkedList)")
        linkedList.append(4)
        print("LinkedList(4 append): \(linkedList)")
        linkedList[2] = 3
        print("LinkedList(3 insert at 2): \(linkedList)")
        
        XCTAssert(linkedList[2] == 3, "wrong behaviour in linkedList work (access to index is not correct)")
        XCTAssert(linkedList.isEmpty == false, "wrong behaviour in linkedList work (isEmpty is not correct)")
        XCTAssert(linkedList.count == 4, "wrong behaviour in queue linkedList (count is not correct)")
        
        linkedList.remove(at: 0)
        print("LinkedList(remove at 0): \(linkedList)")
        linkedList.remove(at: 2)
        print("LinkedList(remove at 2): \(linkedList)")
        XCTAssert(linkedList.count == 2, "wrong behaviour in queue linkedList (count is not correct)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
