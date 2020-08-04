//
//  BinarySearchTreeTest.swift
//  SwiftAlgorithmPractice
//
//  Created by John Choi on 8/3/20.
//  Copyright © 2020 John Choi. All rights reserved.
//

import XCTest

@testable import SwiftAlgorithmPractice

class BinaryTreeTest: XCTestCase {
    
    var stringBt: BinaryTree<String>!
    var intBt: BinaryTree<Int>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stringBt = BinaryTree<String>()
        intBt = BinaryTree<Int>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        stringBt = nil
        intBt = nil
    }

    func testInsertString() throws {
        XCTAssert(stringBt.size == 0)
        
        stringBt.insert(data: "Hello")
        stringBt.insert(data: "World")
        XCTAssert(stringBt.size == 2)
    }

    func testContainsString() throws {
        XCTAssert(stringBt.size == 0)
        
        stringBt.insert(data: "Hello")
        stringBt.insert(data: "World")
        XCTAssertTrue(stringBt.contains(for: "Hello"))
        XCTAssertFalse(stringBt.contains(for: "HELLO"))
        XCTAssertFalse(stringBt.contains(for: "THIS DOES NOT EXIST"))
    }
    
    func testInsertInt() throws {
        XCTAssert(intBt.size == 0)
        
        intBt.insert(data: 5)
        intBt.insert(data: 3)
        XCTAssert(intBt.size == 2)
        
        intBt.insert(data: 2)
        intBt.insert(data: 7)
        intBt.insert(data: 8)
        intBt.insert(data: 4)
        intBt.insert(data: 6)
        XCTAssert(intBt.size == 7)
    }
    
    func testContainsInt() throws {
        XCTAssert(intBt.size == 0)
        
        intBt.insert(data: 5)
        intBt.insert(data: 3)
        intBt.insert(data: 2)
        intBt.insert(data: 7)
        intBt.insert(data: 8)
        intBt.insert(data: 4)
        intBt.insert(data: 6)
        
        XCTAssertTrue(intBt.contains(for: 5))
        XCTAssertTrue(intBt.contains(for: 6))
        XCTAssertFalse(intBt.contains(for: 10))
    }
    
    func testGetMinString() throws {
        XCTAssert(stringBt.size == 0)
        
        stringBt.insert(data: "Hello")
        stringBt.insert(data: "World")
        
        XCTAssertEqual(stringBt.getMin()!, "Hello")
    }
    
    func testGetMinInt() throws {
        intBt.insert(data: 5)
        intBt.insert(data: 3)
        intBt.insert(data: 2)
        intBt.insert(data: 7)
        intBt.insert(data: 8)
        intBt.insert(data: 4)
        intBt.insert(data: 6)
        
        XCTAssertEqual(intBt.getMin()!, 2)
    }
}
