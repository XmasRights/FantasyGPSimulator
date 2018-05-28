//
//  Constructor.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

enum Constructor: String, Codable, EnumCollection
{
    case Mercedes
    case RedBull
    case Ferrari
    case ForceIndia
    case Renault
    case McLaren
    case Williams
    case Sauber
    case ToroRosso
    case Haas
}

extension Constructor: CustomStringConvertible
{
    var description: String
    {
        return self.rawValue
    }
}
