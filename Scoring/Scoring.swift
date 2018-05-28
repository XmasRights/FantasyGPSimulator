//
//  Scoring.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 28/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Scoring
{
    static func scoring(for service: FantasyService, at location: Location) throws -> ScoreType
    {
        do
        {
            let teams   = try Team  .teams (at: location)
            let results = try Result.result(at: location)
            
            switch service
            {
                case .FantasyGP: return FGPScoring(teamData: teams, resultData: results)
                case .Formula1:  return F1Scoring (teamData: teams, resultData: results)
            }
        }
        catch { throw error }
    }
}
