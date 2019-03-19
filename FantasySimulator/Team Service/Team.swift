//
//  Team.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Team {
    let drivers: Set<Driver>
    let constructors: Set<Constructor>
}

extension Team {
    
    var price: Price {
        let d: Price = drivers.reduce(0.0) { $0 + $1.price }
        let c: Price = constructors.reduce(0.0) { $0 + $1.price }
        return d + c
    }
}

extension Team: CustomStringConvertible {
    
    var description: String {
        let d = drivers.map { $0.identifier.rawValue }.joined(separator: ",")
        let c = constructors.map { $0.identifier.rawValue }.joined(separator: ",")
        return "(\(d)) (\(c)) - $\(price)m"
    }
}
