//
//  TeamFactory.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import Foundation

class TeamFactory {
    static let shared: TeamFactory = .init()

    var teams: [Team] {
        get {
            if let t = _teams {
                return t
            } else {
                let loaded = generateTeams()
                _teams = loaded
                return loaded
            }
        }
    }

    private var _teams: [Team]?

    private func generateTeams() -> [Team] {
        let d = Driver.allCases.uniquePermutations(filter: { $0.count == 3 })
        let c = Constructor.allCases.uniquePermutations(filter: { $0.count == 3 })
        return product(c, d)
    }
}

private extension TeamFactory {
    private func product(_ constructors: [[Constructor]], _ drivers: [[Driver]]) -> [Team] {
        return constructors.map { constructor in
            return drivers.map { driver in
                return Team(drivers: Set(driver), constructors: Set(constructor))
            }
        }.flatMap { $0 }
    }
}

