//
//  ScoreType.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 28/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

typealias Score = Int

protocol ScoreType
{
    func score(for driver: Driver) -> Score
    func score(for constructor: Constructor) -> Score
    
    func score(for selection: Selection) -> Score
    
    func leaderboard(for drivers: [Driver]) -> [(Score, Driver)]
    func leaderboard(for constructors: [Constructor]) -> [(Score, Constructor)]
}

extension ScoreType
{
    func score(for selection: Selection) -> Score
    {
        let driverScores = selection.drivers     .reduce(0, { $0 + score(for: $1) })
        let teamScores   = selection.constructors.reduce(0, { $0 + score(for: $1) })
        return driverScores + teamScores
    }
    
    func leaderboard(for drivers: [Driver]) -> [(Score, Driver)]
    {
        return drivers.map { (score(for: $0), $0) }.sorted(by: { $0.0 > $1.0 })
    }
    
    func leaderboard(for constructors: [Constructor]) -> [(Score, Constructor)]
    {
        return constructors.map { (score(for: $0), $0) }.sorted(by: { $0.0 > $1.0 })
    }
}
