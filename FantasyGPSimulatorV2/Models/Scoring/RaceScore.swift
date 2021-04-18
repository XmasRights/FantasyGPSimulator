//
//  RaceScore.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import Foundation

struct RaceScore: Score {
    let race: Race

    func score(for team: Team) -> Int {
        team.drivers.map(score).reduce(0, +)
            + team.constructors.map(score).reduce(0, +)
    }

    func score(for constructor: Constructor) -> Int {
        _raceScore(for: constructor)
            + _bonusScore(for: constructor)
    }

    func score(for driver: Driver) -> Int {
        _raceScore(for: driver)
            + _bonusScore(for: driver)
            + _qualiScore(for: driver)
    }

    func _raceScore(for driver: Driver) -> Int {
        raceResultPoints(driver: driver)
            + fastestLapPoints(driver: driver)
    }

    func _bonusScore(for driver: Driver) -> Int {
        gainedPositionPoints(driver: driver)
    }

    func _qualiScore(for driver: Driver) -> Int {
        polePositionPoints(driver: driver)
            + beatTeamMatePoints(driver: driver)
    }

    func _raceScore(for constructor: Constructor) -> Int {
        raceResultPoints(constructor: constructor)
            + fastestLapPoints(constructor: constructor)
    }

    func _bonusScore(for constructor: Constructor) -> Int {
        gainedPositionPoints(constructor: constructor)
    }
}

private extension RaceScore {
    func fastestLapPoints(driver: Driver) -> Int {
        race.fastestLap == driver ? 1 : 0
    }

    func fastestLapPoints(constructor: Constructor) -> Int {
        let team = race.drivers(for: constructor)
        return team.map(fastestLapPoints).reduce(0, +)
    }

    func raceResultPoints(driver: Driver) -> Int {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        let finish = race.raceResult(for: driver)

        switch finish {
            case .retired:
                return 0

            case .p(let position):
                guard position <= points.count else { return 0 }
                return points[position - 1]
        }
    }

    func raceResultPoints(constructor: Constructor) -> Int {
        let team = race.drivers(for: constructor)
        return team.map(raceResultPoints).reduce(0, +)
    }

    func gainedPositionPoints(driver: Driver) -> Int {
        return gainedPositionPoints(driver: driver, gain: 3)
    }

    func gainedPositionPoints(constructor: Constructor) -> Int {
        let team   = race.drivers(for: constructor)
        let scores = team.map { gainedPositionPoints(driver: $0, gain: 1) }
        return scores.reduce(0, +)
    }

    private func gainedPositionPoints(driver: Driver, gain: Int) -> Int {
        let start  = race.startingGrid(for: driver)
        let finish = race.raceResult(for: driver)

        switch (start, finish) {
            case (.p(let s), .p(let f)) where f < s:
                return (s - f) * gain

            default:
                return 0
        }
    }

    func polePositionPoints(driver: Driver) -> Int {
        let qualifying = race.qualifyingResult(for: driver)

        switch qualifying {
            case .p(let position):
                return (position == 1 ? 10 : 0)

            case .retired:
                return 0
        }
    }

    func beatTeamMatePoints(driver: Driver) -> Int {
        let teammate = race.teammate(of: driver)

        let myPosition    = race.qualifyingResult(for: driver)
        let theirPosition = race.qualifyingResult(for: teammate)

        switch (myPosition, theirPosition) {
            case (.p(let mine), .p(let theirs)):
                return (mine < theirs ? 5 : 0)

            case (.p, _):
                return 5

            default:
                return 0
        }
    }
}
