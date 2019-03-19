//
//  Constructor.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Constructor: Hashable, Codable {
    let identifier: ConstructorId
    let price: Price
}

extension Constructor: CustomStringConvertible {
    
    var description: String {
        return "\(identifier) - $\(price)m"
    }
}
