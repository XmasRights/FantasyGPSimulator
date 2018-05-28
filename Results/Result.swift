//
//  Result.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Result
{
    static func result(at location: Location) throws -> ResultType
    {
        do
        {
            let path = File.raceData(at: location)
            let data: ResultImp = try PlistLoader.load(path: path)
            return data
        }
        catch { throw error }
    }
}

private struct ResultImp: Codable
{
    let finish:     [String : Int]
    let qualifying: [String : Int]
}

extension ResultImp: ResultType
{
    func qualifyingPosition(for driver: Driver) -> Position
    {
        guard let value = qualifying[driver.rawValue]
            else { preconditionFailure() }
        
        return Position(value: value)
    }
    
    func finishingPosition(for driver: Driver) -> Position
    {
        guard let value = finish[driver.rawValue]
            else { preconditionFailure() }
        
        return Position(value: value)
    }
}
