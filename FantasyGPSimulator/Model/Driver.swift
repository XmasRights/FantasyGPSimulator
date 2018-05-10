//
//  Driver.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

enum Driver: String, EnumCollection, Codable
{
    case Hamilton
    case Bottas
    case Vettel
    case Raikkonen
    case Ricciardo
    case Verstappen
    case Ocon
    case Perez
    case Stroll
    case Sirotkin
    case Grosjean
    case Magnussen
    case Hulkenberg
    case Sainz
    case Alonso
    case Vandoorne
    case Ericsson
    case Leclerc
    case Gasly
    case Hartley
}

extension Driver: CustomStringConvertible
{
    var description: String
    {
        return self.rawValue
    }
}
