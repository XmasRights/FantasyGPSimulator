//
//  Constructor.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

enum Constructor: String, EnumCollection, Codable
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
