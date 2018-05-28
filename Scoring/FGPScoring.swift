//
//  FGPScoring.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 28/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct FGPScoring
{
    private let teams: TeamType
    private let result: ResultType
    
    init(teamData: TeamType, resultData: ResultType)
    {
        self.teams = teamData
        self.result = resultData
    }
}

extension FGPScoring: ScoreType
{
    func score(for driver: Driver) -> Score
    {
        let scores = [finishingPositionScore,
                      polePositionScore,
                      outqualifyingPoints,
                      gainedPositionScore]
        
        return scores.map { $0(driver) }
            .reduce(0, +)
    }
    
    func score(for constructor: Constructor) -> Score
    {
        let drivers = teams.drivers(in: constructor)
        return drivers.reduce(0, { $0 + finishingPositionScore(for: $1) })
    }
}

private extension FGPScoring
{
    func finishingPositionScore(for driver: Driver) -> Score
    {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        
        let finish = result.finishingPosition(for: driver)
        
        switch finish
        {
        case .DNF:
            return 0
            
        case .Position(let position):
            guard position <= points.count else { return 0 }
            return points[position - 1]
        }
    }
    
    func polePositionScore(for driver: Driver) -> Score
    {
        let qualifying = result.qualifyingPosition(for: driver)
        
        switch qualifying
        {
        case .Position(let position):
            return (position == 1 ? 10 : 0)
            
        case .DNF:
            return 0
        }
    }
    
    func outqualifyingPoints(for driver: Driver) -> Score
    {
        guard let teammate = teams.teammate(of: driver) else { preconditionFailure() }
        
        let myPosition    = result.qualifyingPosition(for: driver)
        let theirPosition = result.qualifyingPosition(for: teammate)
        
        switch (myPosition, theirPosition)
        {
        case (.Position(let mine), .Position(let theirs)):
            return (mine < theirs ? 5 : 0)
            
        case (.Position(_), _):
            return 5
            
        default:
            return 0
        }
    }
    
    func gainedPositionScore(for driver: Driver) -> Score
    {
        let start  = result.qualifyingPosition(for: driver)
        let finish = result.finishingPosition(for: driver)
        
        switch (start, finish)
        {
        case (.Position(let s), .Position(let f)) where f < s:
            return (s - f) * 3
            
        default:
            return 0
        }
    }
}
