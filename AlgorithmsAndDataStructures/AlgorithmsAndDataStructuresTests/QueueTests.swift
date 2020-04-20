//
//  QueueTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by ksmirnov on 19.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

final class QueueTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQueue() {
        var queue: Queue<Int> = Queue()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        print("Queue(3 enqueue): \(queue)")
        queue.dequeue()
        queue.dequeue()
        print("Queue(2 dequeue): \(queue)")
        queue.enqueue(4)
        print("Queue(1 enqueue): \(queue)")
        
        XCTAssert(queue.count == 2, "wrong behaviour in queue work (count is not correct)")
        XCTAssert(queue.front == 3, "wrong behaviour in queue work (front is not correct)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
