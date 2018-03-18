//
//  PlistResult.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct PlistResult
{
    let qualiData: [String : String]
    let raceData:  [String : String]
}

extension PlistResult: ResultType
{
    func qualifyingPosition(for driver: Driver) -> Position
    {
        guard let result = qualiData[driver.rawValue],
              let value  = Int(result)
            else { preconditionFailure() }
        return Position(value: value)
    }
    
    func finishingPosition(for driver: Driver) -> Position
    {
        guard let result = raceData[driver.rawValue],
              let value  = Int(result)
            else { preconditionFailure() }
        return Position(value: value)
    }
}
