//
//  Team.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Team
{
    static func teams(at location: Location) throws -> TeamType
    {
        do
        {
            let path = File.teamData
            let data: TeamImp = try PlistLoader.load(path: path)
            return data
        }
        catch { throw error }
    }
}

private struct TeamImp: Codable, TeamType
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

