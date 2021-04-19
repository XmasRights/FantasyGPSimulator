//
//  Race.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

protocol Race {
    var name: String { get }

    var info: RaceInfo { get }
    var result: RaceResult? { get }
}

enum Races {
    static let all: [Race] = [
        Bahrain(),
        EmiliaRomagna(),
        Portugal()
    ]
}
