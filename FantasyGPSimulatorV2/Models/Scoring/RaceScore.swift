//
//  RaceScore.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import Foundation

class RaceScore: Score {
    let info: RaceInfo
    let result: RaceResult

    var driverCache = [Driver: Int]()
    var constructorCache = [Constructor: Int]()

    init?(race: Race) {
        guard let result = race.result else { return nil }
        self.info = race.info
        self.result = result
    }

    func score(for constructor: Constructor) -> Int {
        if let score = constructorCache[constructor] {
            return score
        } else {
            let score = _raceScore(for: constructor)
                + _bonusScore(for: constructor)
            constructorCache[constructor] = score
            return score
        }
    }

    func score(for driver: Driver) -> Int {
        if let score = driverCache[driver] {
            return score
        } else {
            let score = _raceScore(for: driver)
                + _bonusScore(for: driver)
                + _qualiScore(for: driver)
            driverCache[driver] = score
            return score
        }
    }
}

extension RaceScore {
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
        result.fastestLap == driver ? 1 : 0
    }

    func fastestLapPoints(constructor: Constructor) -> Int {
        let team = info.drivers(for: constructor)
        return team.map(fastestLapPoints).reduce(0, +)
    }

    func raceResultPoints(driver: Driver) -> Int {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        let finish = result.raceResult(for: driver)

        switch finish {
            case .retired:
                return 0

            case .p(let position):
                guard position <= points.count else { return 0 }
                return points[position - 1]
        }
    }

    func raceResultPoints(constructor: Constructor) -> Int {
        let team = info.drivers(for: constructor)
        return team.map(raceResultPoints).reduce(0, +)
    }

    func gainedPositionPoints(driver: Driver) -> Int {
        return gainedPositionPoints(driver: driver, gain: 3)
    }

    func gainedPositionPoints(constructor: Constructor) -> Int {
        let team   = info.drivers(for: constructor)
        let scores = team.map { gainedPositionPoints(driver: $0, gain: 1) }
        return scores.reduce(0, +)
    }

    private func gainedPositionPoints(driver: Driver, gain: Int) -> Int {
        let start  = result.startingGrid(for: driver)
        let finish = result.raceResult(for: driver)

        switch (start, finish) {
            case (.p(let s), .p(let f)) where f < s:
                return (s - f) * gain

            default:
                return 0
        }
    }

    func polePositionPoints(driver: Driver) -> Int {
        let qualifying = result.qualifyingResult(for: driver)

        switch qualifying {
            case .p(let position):
                return (position == 1 ? 10 : 0)

            case .retired:
                return 0
        }
    }

    func beatTeamMatePoints(driver: Driver) -> Int {
        let teammate = info.teammate(of: driver)

        let myPosition    = result.qualifyingResult(for: driver)
        let theirPosition = result.qualifyingResult(for: teammate)

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
