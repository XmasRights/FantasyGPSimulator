//
//  Entry.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import Foundation

struct Entry: Identifiable {
    let name: String
    let score: Int?
    let price: Double

    var id: String { name }

    var value: Double? {
        guard let score = score else { return nil }
        return Double(score) / price
    }

    var scoreString: String {
        guard let score = score else { return "tbc" }
        return "\(score)"
    }

    var priceString: String {
        let p = String(format: "%0.2f", price)
        return "$\(p)m"
    }
}

extension Entry: Comparable {
    static func < (lhs: Entry, rhs: Entry) -> Bool {
        (lhs.score ?? -1) < (rhs.score ?? -1)
    }
}
