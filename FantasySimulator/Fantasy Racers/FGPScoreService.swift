//
//  FGPScoreService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 13/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FGPScoreService: ScoreService {

    let resultService: ResultService
    let teamService: TeamService
    
    init(location: Location) throws {
        self.resultService = try Result(location: location)
        self.teamService = try FGPTeamService(location: location)
    }
    
    func score(constructor: Constructor) -> Score {
        let raceResult = raceResultPoints(constructor: constructor)
        let gained     = gainedPositionPoints(constructor: constructor)
        return raceResult + gained
    }
    
    func score(driver: Driver) -> Score {
        let raceResult = raceResultPoints(driver: driver)
        let gained     = gainedPositionPoints(driver: driver)
        let pole       = polePositionPoints(driver: driver)
        let beatTM     = beatTeamMatePoints(driver: driver)
        return raceResult + gained + pole + beatTM
    }
}

private typealias Static = FGPScoreService
private extension FGPScoreService {
    
    func raceResultPoints(driver: Driver) -> Score {
        
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        let finish = resultService.racePosition(driver: driver)
        
        switch finish {
            case .DNF:
                return 0
            
            case .P(let position):
                guard position <= points.count else { return 0 }
                return points[position - 1]
        }
    }
    
    func raceResultPoints(constructor: Constructor) -> Score {
        let team = teamService.drivers(in: constructor)
        return team.map(raceResultPoints).reduce(0, +)
    }
    
    func gainedPositionPoints(driver: Driver) -> Score {
        return gainedPositionPoints(driver: driver, gain: 3)
    }
    
    func gainedPositionPoints(constructor: Constructor) -> Score {
        let team   = teamService.drivers(in: constructor)
        let scores = team.map { gainedPositionPoints(driver: $0, gain: 1) }
        return scores.reduce(0, +)
    }
    
    private func gainedPositionPoints(driver: Driver, gain: Int) -> Score {
        let start  = resultService.qualifyingPosition(driver: driver)
        let finish = resultService.racePosition(driver: driver)
        
        switch (start, finish) {
            case (.P(let s), .P(let f)) where f < s:
                return (s - f) * gain
            
            default:
                return 0
        }
    }
    
    func polePositionPoints(driver: Driver) -> Score {
        let qualifying = resultService.qualifyingPosition(driver: driver)

        switch qualifying {
            case .P(let position):
                return (position == 1 ? 10 : 0)
            
            case .DNF:
                return 0
        }
    }
    
    func beatTeamMatePoints(driver: Driver) -> Score {
        
        let teammate = teamService.teammate(of: driver)
        
        let myPosition    = resultService.qualifyingPosition(driver: driver)
        let theirPosition = resultService.qualifyingPosition(driver: teammate)
        
        switch (myPosition, theirPosition) {
            case (.P(let mine), .P(let theirs)):
                return (mine < theirs ? 5 : 0)
            
            case (.P, _):
                return 5
            
            default:
                return 0
        }
    }
}
