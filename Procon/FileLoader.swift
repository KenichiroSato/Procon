//
//  FileLoader.swift
//  Procon
//
//  Created by 2ndDisplay on 2017/02/09.
//
//

import Foundation

class FileLoader {
    
    static var current: Int = 0
    
    static var lines:[String] = {
        let path = Bundle.main.path(forResource: "TextFile", ofType: "txt")!
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            let myStrings = data.components(separatedBy: .newlines)
            return myStrings
        } catch {
            return ["error"]
        }
    }()
    
    static func read() -> String {
        let line = lines[current]
        current+=1
        return line
    }
    
}
