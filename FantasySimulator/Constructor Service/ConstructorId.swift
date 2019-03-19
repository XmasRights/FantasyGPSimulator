//
//  ConstructorId.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

enum ConstructorId: String, CaseIterable, Codable {    
    case RedBull
    case Mercedes
    case Ferarri
    case Renault
    case McLaren
    case RacingPoint
    case AlfaRomeo
    case ToroRosso
    case Williams
    case Haas
}

extension ConstructorId: CustomStringConvertible {
    
    var description: String {
        return self.rawValue
    }
}
