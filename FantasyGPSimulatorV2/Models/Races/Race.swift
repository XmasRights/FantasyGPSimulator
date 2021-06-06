//
//  Race.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

protocol Race {
    var location: Location { get }

    var info: RaceInfo { get }
    var result: RaceResult? { get }
}

extension Race {
    var grandPrixName: String { location.grandPrixName }
    var shortName: String { location.shortName }
    var flag: String { location.flag }
}

enum Races {
    static let all: [Race] = [
        Bahrain(),
        EmiliaRomagna(),
        Portugal(),
        Spain(),
        Monaco(),
        Azerbaijan()
    ]
}
