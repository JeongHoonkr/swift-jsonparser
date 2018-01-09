//
//  JsonCommon.swift
//  JSONParser
//
//  Created by Choi Jeong Hoon on 2017. 12. 29..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// 출력 데이터 추상화 (카운팅 및 Json타입 형태)
protocol JsonDataCommon {
    func readyforPrinting () -> String
    func getCountedType () -> JsonData
}

// 타입별 값을 가져오는 부분 추상화
protocol JSONType {
    func getJsontype () -> JSONType
    func makeValueFromObject () -> String
    func makeValueFromArray () -> String
}

// 타입별 extension
extension Dictionary: JsonDataCommon, JSONType {
    func makeValueFromArray() -> String {
        return JsonPrintingMaker.makeObjectTypeForPrinting(self as! Dictionary<String, JSONType>, innerIndent: 2, outerIndent: 2) + ElementOfString.comma.rawValue
    }
    
    func makeValueFromObject() -> String {
        return JsonPrintingMaker.makeObjectTypeForPrinting(self as! Dictionary<String, JSONType>, innerIndent: 1, outerIndent: 0)
    }
    
    func getJsontype() -> JSONType {
        return self as! Dictionary<String, JSONType>
    }
    
    func getCountedType() -> JsonData {
        return CountingJsonData.getCountedObjectType(self as! Dictionary<String, JSONType>)
    }
    
    func readyforPrinting() -> String{
        return JsonPrintingMaker.makeObjectTypeForPrinting(self as! Dictionary<String, JSONType>, innerIndent: 1, outerIndent: 0)
    }
}

extension Array: JsonDataCommon, JSONType {
    func makeValueFromArray() -> String {
        return JsonPrintingMaker.insertIndentation(indent: 1) + String(describing: self as! [JSONType]) + ElementOfString.comma.rawValue
    }
    
    func makeValueFromObject() -> String {
        return String(describing: self as! [JSONType])
    }
    
    func getJsontype() -> JSONType {
        return self as! [String]
    }
    
    func getCountedType() -> JsonData {
        return CountingJsonData.getCountedArrayType(self as!  [JSONType])
    }
    
    func readyforPrinting() -> String{
        return JsonPrintingMaker.makeArrayTypeForPrinting(self as! [JSONType] )
    }
    
    func makeFileIOPath() throws -> (String, String) {
        let elements = self as! [String]
        let inPath: String
        let outPath: String
        switch elements.count {
        case 2:
            inPath = elements[1]
            outPath = Message.ofDefaultJSONFileName.description
            return (input: inPath, output: outPath)
        case 3:
            inPath = elements[1]
            outPath = elements[2]
            return (input: inPath, output: outPath)
        default:
            throw Message.ofFailedProcessingFile
        }
    }
}

extension Int: JSONType {
    func makeValueFromArray() -> String {
        return String(describing: self) + ElementOfString.comma.rawValue
    }
    
    func makeValueFromObject() -> String {
        return String(describing: self)
    }
    
    func getJsontype() -> JSONType {
        return Int(self)
    }
}

extension String: JSONType {
    func makeValueFromArray() -> String {
        return JsonPrintingMaker.insertIndentation(indent: 1) + ElementOfString.doubleQuotationMarks.rawValue + String(describing: self) + ElementOfString.doubleQuotationMarks.rawValue + ElementOfString.comma.rawValue
    }
    
    func makeValueFromObject() -> String {
        return ElementOfString.doubleQuotationMarks.rawValue + String(describing: self) + ElementOfString.doubleQuotationMarks.rawValue
    }
    
    func getJsontype() -> JSONType {
        return String(self)
    }
}

extension Bool: JSONType {
    func makeValueFromArray() -> String {
        return String(describing: self) + ElementOfString.comma.rawValue
    }
    
    func makeValueFromObject() -> String {
        return String(describing: self)
    }
    
    func getJsontype() -> JSONType {
        return Bool(self)
    }
}
