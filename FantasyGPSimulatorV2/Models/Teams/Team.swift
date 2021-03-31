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

extension Team: Displayable {
    var displayName: String {
        let d = drivers.map { $0.displayName }.sorted()
        let c = constructors.map { $0.displayName }.sorted()

        return """
            \(d.joined(separator: ","))
            \(c.joined(separator: ","))
            """
    }
}
