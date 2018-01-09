//
//  InputView.swift
//  JSONParser
//
//  Created by Choi Jeong Hoon on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func read (_ argument: [String]) throws -> String {
        if argument.count <= 1 {
            return readFromConsole()
        } else if argument.count >= 2 {
            let jsonFile = try argument.makeFileIOPath()
            return try readFromFile(in: jsonFile.0)
        }
        throw Message.ofFailedProcessingFile
    }
    
    private static func readFromConsole() -> String {
        print (Message.ofWelcoming.description)
        if let unanalyzedValue = readLine() {
            guard unanalyzedValue == Message.ofEndingProgram.description else { return unanalyzedValue }
        }
        return Message.ofEndingProgram.description
    }
    
    private static func readFromFile(in filePath: String) throws -> String {
        let directory = FileManager.default.homeDirectoryForCurrentUser
        var textFromFiles: String = ElementOfString.emptyString.rawValue
        do {
            textFromFiles = try String(contentsOf: directory.appendingPathComponent(filePath), encoding: .utf8)
        } catch {
            throw Message.ofFailedProcessingFile
        }
        return textFromFiles
    }
}
