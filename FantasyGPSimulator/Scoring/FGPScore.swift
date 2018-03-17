//
//  FGPScore.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FGPScore: ScoreType
{
    var teams: TeamType
    var result: ResultType
        
    init(teamData: TeamType, resultData: ResultType)
    {
        self.teams = teamData
        self.result = resultData
    }
    
    func score(for driver: Driver) -> Score
    {
        // TODO
        return 0
    }
    
    func score(for constructor: Constructor) -> Score
    {
        // TODO
        return 0
    }
}

extension FGPScore
{
    
}
