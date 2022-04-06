//
//  Constructor.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

struct Constructor: Identifiable, Hashable, Scorable {
    var id: Name { name }
    
    let name: Name
    let price: Double
    let points: Int?
    
    var description: String { name.rawValue }
}

extension Constructor {
    
    enum Name: String {
        case redBull
        case mercedes
        case ferrari
        case alpine
        case mclaren
        case astonMartin
        case alfaRomeo
        case alphaTauri
        case williams
        case haas
    }
}
