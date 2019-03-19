//
//  FileDecoder.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 13/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FileDecoder {
    
    static func qualifyingResult(location: Location) throws -> [DriverId : Position] {
        let file = qualiDir(location: location)
        let data: [String : Int] = try rawData(file: file)
        return encodedResult(data: data)
    }
    
    static func raceResult(location: Location) throws -> [DriverId : Position] {
        let file = raceDir(location: location)
        let data: [String : Int] = try rawData(file: file)
        return encodedResult(data: data)
    }
}

private extension FileDecoder {
    
    static let projectPath = "/Users/christopherfonseka/Code/XmasRights/FantasyGPSimulator/FantasySimulator/"
    
    static var resultsPath: String {
        return projectPath + "Results/"
    }
    
    static func qualiDir(location: Location) -> URL {
        let path = resultsPath + location.rawValue + "Q.plist"
        return URL(fileURLWithPath: path)
    }
    
    static func raceDir(location: Location) -> URL {
        let path = resultsPath + location.rawValue + "R.plist"
        return URL(fileURLWithPath: path)
    }
    
    static func rawData<T: Decodable>(file: URL) throws -> T {
        let data    = try Data(contentsOf: file)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

private extension FileDecoder {
    
    static func encodedResult(data: [String : Int]) -> [DriverId : Position] {
        return data.reduce(into: [DriverId : Position]()) {
            if let driver = DriverId(rawValue: $1.key), let pos = Position($1.value) {
                $0[driver] = pos
            }
        }
    }
}
