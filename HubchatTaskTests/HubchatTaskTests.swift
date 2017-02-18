//
//  HubchatTaskTests.swift
//  HubchatTaskTests
//
//  Created by Bratislav Ljubisic on 2/17/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import XCTest
@testable import HubchatTask

class HubchatTaskTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testHCModelGetForumData() {
        
        let exp = expectation(description: "Alamofire")
        
        let model = HCModel()
        
        model.getPhotographyForumHeader { (json) in
            print(json.stringValue)
            XCTAssertNotNil(json, "Expected non-nil json")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)

    }
    
    func testHCModelGetForumPosts() {
        
        let exp = expectation(description: "Alamofire")
        
        let model = HCModel()
        
        model.getPhotographyForumPosts{ (json) in
            print(json.stringValue)
            XCTAssertNotNil(json, "Expected non-nil json")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)
        
    }
    
}
