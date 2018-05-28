//
//  Simulator.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 28/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Simulator
{
    struct DriverResult
    {
        let driver: Driver
        let score: Score
    }
    
    static func generateDriverLeaderboard(for location: Location, using service: FantasyService) throws -> [DriverResult]
    {
        do
        {
            let scores  = try Scoring.scoring(for: service, at: location)
            let drivers = Driver.allValues
            
            return drivers.map
            {   driver -> DriverResult in
                
                let score = scores.score(for: driver)
                return DriverResult(driver: driver, score: score)
            }
        }
        catch { throw error }
    }
}
