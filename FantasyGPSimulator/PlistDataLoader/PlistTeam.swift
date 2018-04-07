//
//  PlistTeam.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct PlistTeam
{
    // TODO Validate Data
    let data: [String : [String]]
}

extension PlistTeam: TeamType
{
    func team(of driver: Driver) -> Constructor
    {
        guard let entry = data.first(where: { $0.value.contains(driver.rawValue) }),
              let team  = Constructor(rawValue: entry.key)
            else { preconditionFailure() }
        
        return team
    }
    
    func teammate(of driver: Driver) -> Driver
    {
        guard let entry = data.first(where: { $0.value.contains(driver.rawValue) })
            else { preconditionFailure() }
        
        let others = entry.value.filter { $0 != driver.rawValue }
        
        guard let tmString = others.first,
              let teammate = Driver(rawValue: tmString)
            else { preconditionFailure() }
        
        return teammate
    }
    
    func drivers(in constructor: Constructor) -> Set<Driver>
    {
        guard let entry = data[constructor.rawValue]
            else { preconditionFailure() }
        
        return Set(entry.compactMap { Driver(rawValue: $0) })
    }
}
