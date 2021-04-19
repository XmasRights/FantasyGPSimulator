//
//  SeasonScore.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import Foundation

struct SeasonScore: Score {
    let scoreArray: [Score] = {
        Races.all.compactMap(RaceScore.init)
    }()

    func score(for driver: Driver) -> Int {
        scoreArray
            .map { $0.score(for: driver) }
            .reduce(0, +)
    }

    func score(for constructor: Constructor) -> Int {
        scoreArray
            .map { $0.score(for: constructor) }
            .reduce(0, +)
    }
}
