//
//  PhoneBookTests.swift
//  PhoneBookTests
//
//  Created by Ade Wija Nugraha on 8/9/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import XCTest
@testable import PhoneBook

class PhoneBookTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsertingPhoneBookDataToCoreData() {
        let dap = PhoneBookDataAccessProvider()
        
        //fetch initial count from database
        let initialDataCount = dap.fetchPhoneBookData().count
        
        //inserting new data
        let name = "Ade"
        let phoneNumber = "+8712984912321"
        _ = dap.addPhoneBookData(name: name, phoneNumber: phoneNumber)
        
        //fetch data count after inserting new data
        let data = dap.fetchPhoneBookData()
        let finalDataCount = data.count
        
        NSLog("Phone Book Data : %@", data )
        XCTAssertEqual(initialDataCount + 1 , finalDataCount)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
