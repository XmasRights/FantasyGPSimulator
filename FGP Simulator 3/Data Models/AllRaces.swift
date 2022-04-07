//
//  AllRaces.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 06/04/2022.
//

import Foundation

struct AllRaces: Race {
    var id: String { "F1 2022" }

    var drivers: [Driver] {
        Driver.Name.allCases
            .map { name in allRaces.compactMap { $0.driver(name: name) }}
            .compactMap { $0.combine() }
    }

    var constructors: [Constructor] {
        Constructor.Name.allCases
            .map { name in allRaces.compactMap { $0.constructor(name: name) }}
            .compactMap { $0.combine() }
    }

    var pointThreshold: Int {
        250
    }
}

private extension AllRaces {

    var allRaces: [Race] {
        [
            Bahrain(),
            SaudiArabia(),
            Australia()
        ]
    }
}


extension Array where Element == Driver {

    func combine() -> Driver? {
        guard !isEmpty else { return nil }

        let name = self.first!.name
        let price  = self.last!.price
        let points = self.compactMap(\.points).reduce(0, +)

        return .init(name: name, price: price, points: points)
    }
}

extension Array where Element == Constructor {

    func combine() -> Constructor? {
        guard !isEmpty else { return nil }

        let name = self.first!.name
        let price  = self.last!.price
        let points = self.compactMap(\.points).reduce(0, +)

        return .init(name: name, price: price, points: points)
    }
}

extension Race {

    func driver(name: Driver.Name) -> Driver? {
        drivers.first(where: { $0.name == name })
    }

    func constructor(name: Constructor.Name) -> Constructor? {
        constructors.first(where: { $0.name == name })
    }
}
