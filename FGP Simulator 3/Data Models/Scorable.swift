//
//  Scorable.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 03/04/2022.
//

import Foundation

protocol Scorable {
        
    var price: Double { get }
    var points: Int? { get }

    var shortName: String { get }
    var longName: String { get }
}

extension Scorable {
    
    var value: Double? {
        guard let points = points else { return nil }
        return Double(points) / price
    }
}
