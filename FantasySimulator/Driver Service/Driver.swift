//
//  Driver.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Driver: Equatable, Hashable, Codable {
    let identifier: DriverId
    let constructor: ConstructorId
    let price: Price
}

extension Driver: CustomStringConvertible {
    
    var description: String {
        return "\(identifier) (\(constructor)) - \(formattedPrice)"
    }
    
    private var formattedPrice: String {
        return "$\(price)m"
    }
}
