//
//  ScoreService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol ScoreService {
    func score(driver: Driver) -> Score
    func score(constructor: Constructor) -> Score
}

extension ScoreService {
    func score(team: Team) -> Score {
        let d = team.drivers.reduce(0) { $0 + score(driver: $1) }
        let c = team.constructors.reduce(0) { $0 + score(constructor: $1) }
        return d + c
    }
}
