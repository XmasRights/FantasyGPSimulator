//
//  Driver.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

struct Driver: Identifiable, Hashable, Scorable {
    var id: Name { name }
    
    let name: Name
    let price: Double
    let points: Int?
    
    var description: String { name.rawValue }
}

extension Driver {
    
    enum Name: String {
        case verstappen
        case perez
        case russell
        case hamilton
        case leclerc
        case sainz
        case alonso
        case ocon
        case norris
        case ricciardo
        case vettel
        case stroll
        case bottas
        case zhou
        case tsunoda
        case gasly
        case latifi
        case albon
        case schumacher
        case magnussen
    }
}
