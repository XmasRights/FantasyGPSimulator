//
//  Score.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

protocol Score {
    func score(for constructor: Constructor) -> Int
    func score(for driver: Driver) -> Int
}

extension Score {
    func score(for team: Team) -> Int {
        team.drivers.map(score).reduce(0, +)
            + team.constructors.map(score).reduce(0, +)
    }
}
