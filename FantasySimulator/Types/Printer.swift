//
//  Printer.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 13/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Printer {
    
    static func FGPScoreboard(budget: ClosedRange<Price>, minScore: Score, location: Location) throws {
        
        let teamService = try FGPTeamService(location: location)
        let scoreService = try FGPScoreService(location: location)
        
        let teams = teamService.teams(budget: budget)
        let scored = teams.map { team -> (Team, Score) in
            let score = scoreService.score(team: team)
            return (team, score)
        }
        
        let filtered = scored.filter { $0.1 > minScore }
        
        filtered.sorted(by: { $0.1 > $1.1 }).forEach {
            print("\($0.1) - \($0.0)")
        }
    }
    
    static func FGPF15Scoreboard(budget: ClosedRange<Price>, minScore: Score, location: Location) throws {
        
        let teamService = try FGPTeamService(location: location)
        let scoreService = try FGPScoreService(location: location)
        
        let teams = teamService.f15teams(budget: budget)
        let scored = teams.map { team -> (Team, Score) in
            let score = scoreService.score(team: team)
            return (team, score)
        }
        
        let filtered = scored.filter { $0.1 > minScore }
        
        filtered.sorted(by: { $0.1 > $1.1 }).forEach {
            print("\($0.1) - \($0.0)")
        }
    }
    
    static func FGPDriverScores(at location: Location) throws {
        let fantasyGP = try FGPTeamService(location: location)
        let scores    = try FGPScoreService(location: location)
        
        let scored = fantasyGP.drivers.map { driver -> (Driver, Score, Double) in
            let score = scores.score(driver: driver)
            let scorePerPound = Double(score) / driver.price
            return (driver, score, scorePerPound)
        }
        
        scored.sorted(by: { $0.1 > $1.1 }).forEach {
            print("\($0.1) - \($0.0) - \(String(format: "%.2f", arguments: [$0.2]))")
        }
    }
    
    static func FGPConstructorScores(at location: Location) throws {
        let fantasyGP = try FGPTeamService(location: location)
        let scores    = try FGPScoreService(location: location)
        
        let scored = fantasyGP.constructors.map { constructor -> (Constructor, Score) in
            let score = scores.score(constructor: constructor)
            return (constructor, score)
        }
        
        scored.sorted(by: { $0.1 > $1.1 }).forEach {
            print("\($0.1) - \($0.0)")
        }
    }
}
