//
//  Team.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import Foundation

struct Team: Hashable {
    let drivers: Set<Driver>
    let constructors: Set<Constructor>
}
