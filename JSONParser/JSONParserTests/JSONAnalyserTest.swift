//
//  JSONAnalyserTest.swift
//  JSONParserTests
//
//  Created by TaeHyeonLee on 2017. 11. 6..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

@testable import JSONParser

class JSONAnalyserTest: XCTestCase {
    var jsonData : JSONData!
    let tester : Array<String> = [ "10", "\"jk\"", "4", "\"314\"", "99", "\"crong\"", "false" ]
    var objectTester : Array<String> = ["{\"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"married\" : true}"]
    var jsonObject : JSONObject!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        jsonData = nil
    }

    func testGetJSONData() {
        jsonData = JSONAnalyser.getJSONData(items: tester)
        XCTAssertTrue(jsonData[0] is Int)
        XCTAssertTrue(jsonData[1] is String)
        XCTAssertTrue(jsonData[2] is Int)
        XCTAssertTrue(jsonData[3] is String)
        XCTAssertTrue(jsonData[4] is Int)
        XCTAssertTrue(jsonData[5] is String)
        XCTAssertTrue(jsonData[6] is Bool)
    }
    
    func testGetJSONDataFromObject() {
        jsonData = JSONAnalyser.getJSONData(items: objectTester)
        XCTAssertTrue(jsonData[0] is JSONObject)
        let dic : JSONObject = jsonData[0] as! JSONObject
        XCTAssertEqual(dic.count, 4)
    }
    
    /* private functions
    func testGetObjectType() {
        objectTester = ["\"name\" : \"KIM JUNG\"", "\"alias\" : \"JK\"", "\"level\" : 5", "\"married\" : true"]
        XCTAssertEqual(objectTester.count, 4)
        jsonObject = JSONAnalyser.getJSONObject(items: objectTester)
        XCTAssertEqual(jsonObject.count, 4)
        XCTAssertEqual(jsonObject["name"] as! String, "KIM JUNG")
        XCTAssertEqual(jsonObject["alias"] as! String, "JK")
        XCTAssertEqual(jsonObject["level"] as! Int, 5)
        XCTAssertEqual(jsonObject["married"] as! Bool, true)
    }
    */

}