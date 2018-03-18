//
//  PlistScore.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct PlistScore
{
    let teamData:  [String : [String]]
    let qualiData: [String : String]
    let raceData:  [String : String]
}

extension PlistScore: ScoreType
{
    func score(for driver: Driver) -> Score
    {
        let scoring = FGPScore(teamData: teams, resultData: result)
        return scoring.score(for: driver)
    }
    
    func score(for constructor: Constructor) -> Score
    {
        let scoring = FGPScore(teamData: teams, resultData: result)
        return scoring.score(for: constructor)
    }
    
    var teams: TeamType
    {
        return PlistTeam(data: teamData)
    }
    
    var result: ResultType
    {
        return PlistResult(qualiData: qualiData, raceData: raceData)
    }
}

