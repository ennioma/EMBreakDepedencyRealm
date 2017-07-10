//
//  EMBreakDepedencyRealmTests.swift
//  EMBreakDepedencyRealmTests
//
//  Created by Ennio Masi on 10/07/2017.
//  Copyright © 2017 ennioma. All rights reserved.
//

import XCTest
@testable import EMBreakDepedencyRealm

class EMBreakDepedencyRealmTests: XCTestCase {
    var storage: StorageContext?
    
    override func setUp() {
        super.setUp()
        
        do {
            try self.storage = RealmStorageContext(configuration: ConfigurationType.inMemory(identifier: self.name!))
        } catch {
            XCTFail()
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
        do {
            try self.storage?.deleteAll(PFARecord.self)
        } catch {
            XCTFail()
        }
    }
    
    func testCreateEmptyRecord() {
        let exp = self.expectation(description: "waiting for object created")
        
        try! self.storage?.create(PFARecord.self, completion: { (storedObject) in
            print("😚🤠: \(storedObject)")
            
            exp.fulfill()
        })
        
        self.waitForExpectations(timeout: 2)
    }
    
    func testSaveRecord() {
        let record = PFARecord()
        record.title = "Unexpected expense"
        record.price = 1.0
        
        do {
            try self.storage?.save(object: record)
        } catch _ as NSError {
            XCTFail("Impossible to save the current record")
        }
    }
    
    func testSaveAndFetch() {
        self.testSaveRecord()
        
        do {
            let exp = self.expectation(description: "wait for fetch")
            
            self.storage?.fetch(PFARecord.self, predicate: nil, sorted: nil, completion: { (records) in
                XCTAssertEqual(records.count, 1)
                exp.fulfill()
            })
            
            self.waitForExpectations(timeout: 2, handler: nil)
        }
    }
    
}
