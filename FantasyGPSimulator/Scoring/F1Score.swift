//
//  F1Score.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 27/04/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct F1Score
{
    private let teams: TeamType
    private let result: ResultType
    
    init(teamData: TeamType, resultData: ResultType)
    {
        self.teams = teamData
        self.result = resultData
    }
}

extension F1Score: ScoreType
{
    func score(for driver: Driver) -> Score
    {
        let scores = [qualifyingScores(),
                      qualifyingScores_driverOnly(),
                      finishScores(),
                      finishScores_driverOnly()].flatMap { $0 }
        
        return scores.map { $0(driver) }.reduce(0, +)
    }
    
    func score(for constructor: Constructor) -> Score
    {
        func constructorScore(for driver: Driver) -> Score
        {
            let scores = [qualifyingScores(),
                          finishScores()].flatMap { $0 }
            
            return scores.map { $0(driver) }.reduce(0, +)
        }
        
        let drivers = teams.drivers(in: constructor)
        
        return drivers.reduce(0) { $0 + constructorScore(for: $1) }
    }
}

private extension F1Score
{
    func qualifyingScores() -> [(Driver) -> Score]
    {
        return [qualifyingProgressionScore,
                qualifyingPositionBonusScore]
    }
    
    func qualifyingScores_driverOnly() -> [(Driver) -> Score]
    {
        return [outqualifyingScore,
                didNotQualifyScore]
    }
    
    // MARK: Qualifying (General)
    func qualifyingProgressionScore(for driver: Driver) -> Score
    {
        func score(for position: Int) -> Score
        {
            switch position
            {
                case 1...10: return 3
                case 11...15: return 2
                default: return 1
            }
        }
        
        let quali = result.qualifyingPosition(for: driver)
        
        switch quali
        {
            case .DNF: return 0
            case .Position(let x): return score(for: x)
        }
    }
    
    // MARK: Qualifying (General, Driver Only)
    func outqualifyingScore(for driver: Driver) -> Score
    {
        guard let teammate = teams.teammate(of: driver) else { return 0 }
        
        let myPosition    = result.qualifyingPosition(for: driver)
        let theirPosition = result.qualifyingPosition(for: teammate)
        
        switch (myPosition, theirPosition)
        {
            case (.Position(let mine), .Position(let theirs)):
                return (mine < theirs ? 2 : 0)
            
            case (.Position(_), _):
                return 2
            
            default:
                return 0
        }
    }
    
    func didNotQualifyScore(for driver: Driver) -> Score
    {
        let quali = result.qualifyingPosition(for: driver)
        
        switch quali
        {
            case .DNF: return -5
            case .Position(_): return 0
        }
    }
    
    // MARK: Qualifying (Position Bonuses)
    func qualifyingPositionBonusScore(for driver: Driver) -> Score
    {
        func score(for position: Int) -> Score
        {
            switch position
            {
                case 1...10: return 10 - (position - 1)
                default: return 0
            }
        }
        
        let quali = result.qualifyingPosition(for: driver)
        
        switch quali
        {
        case .DNF: return 0
        case .Position(let x): return score(for: x)
        }
    }
}

private extension F1Score
{
    func finishScores() -> [(Driver) -> Score]
    {
        return [finishRaceScore,
                finishPositionsGained,
                finishStartedTop10LostPositionsScore,
                finishStartedBottom10LostPositionsScore,
                finishPositionBonusScore]
    }
    
    func finishScores_driverOnly() -> [(Driver) -> Score]
    {
        return [finishAheadOfTeammateScore,
                dnfScore]
    }
    
    // MARK: Race (General)
    func finishRaceScore(for driver: Driver) -> Score
    {
        let finish = result.finishingPosition(for: driver)
        
        switch finish
        {
            case .DNF: return 0
            case .Position(_): return 1
        }
    }
    
    func finishPositionsGained(for driver: Driver) -> Score
    {
        let start  = result.qualifyingPosition(for: driver)
        let finish = result.finishingPosition(for: driver)
        
        switch (start, finish)
        {
        case (.Position(let s), .Position(let f)) where f < s:
            return min((s - f) * 2, 10)
            
        default:
            return 0
        }
    }
    
    func finishStartedTop10LostPositionsScore(for driver: Driver) -> Score
    {
        let start  = result.qualifyingPosition(for: driver)
        let finish = result.finishingPosition(for: driver)
        
        switch (start, finish)
        {
            case (.Position(let s), .Position(let f)) where s >= 10 && f > s:
                return max((s - f) * 2, -10)
            
            default:
                return 0
        }
    }
    
    func finishStartedBottom10LostPositionsScore(for driver: Driver) -> Score
    {
        let start  = result.qualifyingPosition(for: driver)
        let finish = result.finishingPosition(for: driver)
        
        switch (start, finish)
        {
        case (.Position(let s), .Position(let f)) where s < 10 && f > s:
            return max((s - f) * 1, -5)
            
        default:
            return 0
        }
    }
    
    func finishPositionBonusScore(for driver: Driver) -> Score
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
    
    // MARK: Race (General, Driver Only)
    func finishAheadOfTeammateScore(for driver: Driver) -> Score
    {
        guard let teammate = teams.teammate(of: driver) else { preconditionFailure() }
        
        let myPosition    = result.finishingPosition(for: driver)
        let theirPosition = result.finishingPosition(for: teammate)
        
        switch (myPosition, theirPosition)
        {
        case (.Position(let mine), .Position(let theirs)):
            return (mine < theirs ? 3 : 0)
            
        case (.Position(_), _):
            return 3
            
        default:
            return 0
        }
    }
    
    func dnfScore(for driver: Driver) -> Score
    {
        let finish = result.qualifyingPosition(for: driver)
        
        switch finish
        {
            case .DNF: return -15
            case .Position(_): return 0
        }
    }
    
}
