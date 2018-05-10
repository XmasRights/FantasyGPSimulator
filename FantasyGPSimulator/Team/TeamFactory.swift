//
//  TeamFactory.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 29/04/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Team
{
    static func team(at location: Location) throws -> TeamType
    {
        do
        {
            let data: TeamRawData = try PlistLoader.load(resource: "Default", subdirectory: "Data/Team")
            return data
        }
        catch
        {
            throw error
        }
    }
}

private struct TeamRawData: Codable, TeamType
{
    let data: [String : [String]]
    
    func team(of driver: Driver) -> Constructor?
    {
        return data.compactMap { $0.value.contains(driver.rawValue) ? $0.key : nil  }
                   .compactMap { Constructor(rawValue: $0) }
                   .first
    }
    
    func teammate(of driver: Driver) -> Driver?
    {
        let drivers = data.compactMap { $0.value.contains(driver.rawValue) ? $0.value : nil }.flatMap { $0 }
        let unique  = drivers.filter { $0 != driver.rawValue }
                             .compactMap { Driver(rawValue: $0) }
        return unique.first
    }
    
    func drivers(in constructor: Constructor) -> Set<Driver> {
        let entry = data[constructor.rawValue] ?? []
        let drivers = entry.compactMap { Driver(rawValue: $0) }
        return Set(drivers)
    }
}




