//
//  Result.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Result: ResultService {
    
    func qualifyingPosition(driver: DriverId) -> Position {
        return quali[driver]!
    }
    
    func racePosition(driver: DriverId) -> Position {
        return race[driver]!
    }
    
    private let quali: [DriverId : Position]
    private let race: [DriverId : Position]
    
    init(location: Location) throws {
        self.quali = try FileDecoder.qualifyingResult(location: location)
        self.race  = try FileDecoder.raceResult(location: location)
    }
}
