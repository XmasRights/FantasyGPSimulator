//
//  ResultService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol ResultService {
    func qualifyingPosition(driver: DriverId) -> Position
    func racePosition(driver: DriverId) -> Position
}

extension ResultService {
    func qualifyingPosition(driver: Driver) -> Position {
        return qualifyingPosition(driver: driver.identifier)
    }
    
    func racePosition(driver: Driver) -> Position {
        return racePosition(driver: driver.identifier)
    }
}
