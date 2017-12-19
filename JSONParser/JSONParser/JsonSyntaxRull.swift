//
//  JsonSyntaxRull.swift
//  JSONParser
//
//  Created by Choi Jeong Hoon on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// Json 문법 구조체
struct JSONPattern {
    static let ofString = "\\s*?\".+\"\\s*?"
    static let ofInt = "\\s*?\\d+\\s*?"
    static let ofBool = "\\s*?(true|false)\\s*?"
    static let ofDictionary = "\\s*?\(ofString):(\(ofInt)|\(ofString)|\(ofBool))\\s*?"
    static let ofObject = "[\\{]\\s*?(\(ofDictionary)[,]?)+\\s*?[\\}]\\s*?"
    static let ofArray = "\\[\\s*?((\(ofInt)|\\s*?\(ofString)|\\s*?\(ofBool)|\\s*?\(ofObject))[,]?)+\\s*?\\]\\s*?"
}
