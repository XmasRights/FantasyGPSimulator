//
//  RawRaceData.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

private struct RawRaceData: Codable
{
    let teams:  [String : [String]]
    let prices: [String : [String : String]]
}

struct PlistRaceDataLoader
{
    private let data: RawRaceData
    
    init?(location: Location)
    {
        let decoder = PropertyListDecoder()
        
        guard let data = PlistRaceDataLoader.retrieveData(for: location),
              let decoded = try? decoder.decode(RawRaceData.self, from: data)
            else { return nil }
        
        self.data = decoded
    }
    
}

private extension PlistRaceDataLoader
{
    static func retrieveURL(for location: Location) -> URL?
    {
        return Bundle.main.url(forResource: location.rawValue, withExtension: "plist")
    }
    
    static func retrieveData(for location: Location) -> Data?
    {
        guard let url = retrieveURL(for: location) else { return nil }
        return try? Data(contentsOf: url)
    }
}


