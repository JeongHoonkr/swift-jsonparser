//
//  JsonSyntaxRull.swift
//  JSONParser
//
//  Created by Choi Jeong Hoon on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// Json 문법 구조체
struct JsonGrammerRule {
    static let ofString = "\\s*?\"[a-zA-Z\\d\\s]+\"\\s*?"
    static let ofInt = "\\s*?\\d+\\s*?"
    static let ofBool = "\\s*?(true|false)\\s*?"
    static let ofDictionary = "\\s*?\(ofString)\\s*?:\\s*?(\(ofInt)|\\s*?\(ofString)|\\s*?\(ofBool))\\s*?"
    static let ofObject = "[\\{]\\s*?(\(ofDictionary)\\s*?[,]?\\s*?)+\\s*?[\\}]\\s*?"
    static let ofArray = "\\[\\s*?((\(ofInt)|\\s*?\(ofString)|\\s*?\(ofBool)|\\s*?\(ofObject))[,]?)+\\s*?\\]\\s*?"
    static let value = "(\"[^,:\\\"\\{\\[\\]\\}]+?\"|true|false|\\d+)"
    
    static let nestedDictionaryPattern = "\(ofString)\\s*?:\\s*?(\(ofString)|\(ofInt)|\(ofBool)|\(ofObject)|\(ofArray))"
    static let nestedObjectPattern = "\\{(\(nestedDictionaryPattern)\\s*?[,]?\\s*?)+\\s*?[\\}]\\s*?"
    static let nestedArrayPattern = "\\s*\\[((\(ofString)|\(ofInt)|\(ofBool)|\(ofObject)|\(ofArray))[,]?)+\\s*\\]"
}
