//
//  window_shopperTests.swift
//  window-shopperTests
//
//  Created by Danylo Kushlianskyi on 23.04.2022.
//

import XCTest

class window_shopperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testGetHours(){
        XCTAssert(Wage.getHours(forWage: 25, forPrice: 100) == 4)
        XCTAssert(Wage.getHours(forWage: 15.50, forPrice: 250.53) == 17)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
