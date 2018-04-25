//
//  RaceResult.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation


private struct RawRaceData: Codable
{
    let results: [String : [String : Int]]
    let teams:   [String : [String]]
}

struct Result
{
    private let data: RawRaceData
    
    init?(location: Location)
    {
        let decoder = PropertyListDecoder()
        
        guard let data = Result.data(for: location)
            else { return nil }
        
        guard let decoded = try? decoder.decode(RawRaceData.self, from: data)
            else { return nil }
        
        self.data = decoded
    }
}

extension Result: ResultType
{
    func qualifyingPosition(for driver: Driver) -> Position
    {
        guard let quali = data.results["qualifying"],
              let value = quali[driver.rawValue]
            else { preconditionFailure() }
        
        return Position(value: value)
    }
    
    func finishingPosition(for driver: Driver) -> Position
    {
        guard let quali = data.results["finish"],
              let value = quali[driver.rawValue]
            else { preconditionFailure() }
        
        return Position(value: value)
    }
}

extension Result: TeamType
{
    func team(of driver: Driver) -> Constructor
    {
        guard let entry = data.teams.first(where: { $0.value.contains(driver.rawValue) }),
            let team  = Constructor(rawValue: entry.key)
            else { preconditionFailure() }
        
        return team
    }
    
    func teammate(of driver: Driver) -> Driver
    {
        guard let entry = data.teams.first(where: { $0.value.contains(driver.rawValue) })
            else { preconditionFailure() }
        
        let others = entry.value.filter { $0 != driver.rawValue }
        
        guard let tmString = others.first,
            let teammate = Driver(rawValue: tmString)
            else { preconditionFailure() }
        
        return teammate
    }
    
    func drivers(in constructor: Constructor) -> Set<Driver>
    {
        guard let entry = data.teams[constructor.rawValue]
            else { preconditionFailure() }
        
        return Set(entry.compactMap { Driver(rawValue: $0) })
    }
}

private extension Result
{
    static func url(for location: Location) -> URL?
    {
        return Bundle.main.url(forResource: location.rawValue, withExtension: "plist", subdirectory: "Data/Race")
    }
    
    static func data(for location: Location) -> Data?
    {
        guard let url = url(for: location) else { return nil }
        return try? Data(contentsOf: url)
    }
}


