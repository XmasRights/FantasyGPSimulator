//
//  RaceResult.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import Foundation

enum Position {
    case p(Int)
    case retired
}

protocol RaceResult {
    func qualifyingResult(for: Driver) -> Position
    func startingGrid(for: Driver) -> Position
    func raceResult(for: Driver) -> Position
    var fastestLap: Driver { get }
}
