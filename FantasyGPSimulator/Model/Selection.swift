//
//  Selection.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Selection
{
    let drivers: Set<Driver>
    let constructors: Set<Constructor>
}

extension Selection: Hashable
{
    var hashValue: Int
    {
        return drivers.hashValue ^ constructors.hashValue
    }

    static func ==(lhs: Selection, rhs: Selection) -> Bool
    {
        return lhs.drivers == rhs.drivers && lhs.constructors == rhs.constructors
    }
}

extension Selection: CustomStringConvertible
{
    var description: String
    {
        return "{ \(Array(drivers)) \(Array(constructors)) }"
    }
}

extension Selection
{
    static func allSelections() -> Set<Selection>
    {
        let constructors = Constructor.allValues.uniquePermutations(filter: { $0.count == 3 })
        let drivers = Driver.allValues.uniquePermutations(filter: { $0.count == 3 })
        
        return Set(product(of: constructors, and: drivers))
    }
    
    private static func product(of constructors: [[Constructor]], and drivers: [[Driver]]) -> [Selection]
    {
        return constructors.map
        {   constructor in
            
            return drivers.map
            {   driver in
                return Selection(drivers: Set(driver), constructors: Set(constructor))
            }
        }.flatMap { $0 }
    }
}
