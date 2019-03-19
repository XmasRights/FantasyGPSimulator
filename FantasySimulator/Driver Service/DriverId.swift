//
//  DriverId.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

enum DriverId: String, CaseIterable, Codable {
    case Raikkonen
    case Giovinazzi
    case Vettel
    case Leclerc
    case Grosjean
    case Magnussen
    case Norris
    case Sainz
    case Hamilton
    case Bottas
    case Perez
    case Stroll
    case Gasly
    case Verstappen
    case Ricciardo
    case Hulkenberg
    case Albon
    case Kvyat
    case Russell
    case Kubica
}

extension DriverId: CustomStringConvertible {
    
    var description: String {
        return self.rawValue
    }
}
