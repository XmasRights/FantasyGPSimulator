//
//  TeamFactory.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import Foundation

class TeamFactory {
    init(drivers: [Driver], constructors: [Constructor]) {
        self.drivers = drivers
        self.constructors = constructors
    }

    let drivers: [Driver]
    let constructors: [Constructor]

    var teams: [Team] {
        let d = drivers.uniquePermutations(filter: { $0.count == 3 })
        let c = constructors.uniquePermutations(filter: { $0.count == 3 })
        return product(c, d)
    }

    // TODO
//    func teams(budget: ClosedRange<Int>) -> [Team] {
//        return teams.filter { budget.contains($0.price) }
//    }
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

