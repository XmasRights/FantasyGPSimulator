//
//  Selection.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
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
    static func allSelections(drivers: Int, constructors: Int) -> Set<Selection>
    {
        precondition(drivers >= 0 && constructors >= 0)
        
        let constructors = Constructor.allValues.uniquePermutations(filter: { $0.count == constructors })
        let drivers = Driver.allValues.uniquePermutations(filter: { $0.count == drivers })
        
        return Set(product(of: constructors, and: drivers))
    }
    
    static func selectionsIncluding(drivers: Int, constructors: Int, using filter: @escaping (Selection) -> Bool) -> Set<Selection>
    {
        return allSelections(drivers: drivers, constructors: constructors).filter(filter)
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
