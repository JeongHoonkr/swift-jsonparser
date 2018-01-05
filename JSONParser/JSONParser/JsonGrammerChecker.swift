//
//  JsonGrammerChecker.swift
//  JSONParser
//
//  Created by Choi Jeong Hoon on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// Json 문법검사 구조체
struct GrammerChecker {
    // 문법을 검사하여 통과시 배열로 반환
    static func makeValidString (values: String) throws -> String {
        guard try checkIsValidJsonArrayPattern(values) || checkIsValidJsonObjectPattern(values) else { throw Message.ofInvalidFormat }
        return findJsonString(from: values)
    }
    
    // JsonArray패턴에 맞는지 검사
    private static func checkIsValidJsonArrayPattern (_ stringValue: String)  throws -> Bool{
        guard stringValue.starts(with: "[") else { return false }
        let regex = try NSRegularExpression(pattern: JsonGrammerRule.ofNestedArray)
        let results = regex.matches(in: stringValue, range: NSRange(location: 0, length: stringValue.count))
        return !results.isEmpty
    }
    
    // JsonObject패턴에 맞는지 검사
    private static func checkIsValidJsonObjectPattern (_ stringValue: String)  throws -> Bool{
        guard stringValue.starts(with: "{") else { return false }
        let regex = try NSRegularExpression(pattern: JsonGrammerRule.ofNestedObject)
        let results = regex.matches(in: stringValue, range: NSRange(location: 0, length: stringValue.count))
        return !results.isEmpty
    }
    
    // 문자열에서 공백만 제거
    private static func findJsonString (from validString: String) -> String{
        let removedWhiteSpace = validString.filter { $0 != " " }
        return removedWhiteSpace
    }
    
}

