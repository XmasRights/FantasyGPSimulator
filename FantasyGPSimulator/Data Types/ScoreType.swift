//
//  ScoreType.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

typealias Score = Int

protocol ScoreType
{
    func score(for driver: Driver) -> Score
    func score(for constructor: Constructor) -> Score
    func score(for selection: Selection) -> Score
}

extension ScoreType
{
    func score(for selection: Selection) -> Score
    {
        let driverScores = selection.drivers     .reduce(0, { $0 + score(for: $1) })
        let teamScores   = selection.constructors.reduce(0, { $0 + score(for: $1) })
        return driverScores + teamScores
    }
}
