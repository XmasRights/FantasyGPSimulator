//
//  Race+Team.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation
import Algorithms

struct Team: Identifiable {
    var id: String {
        let d = drivers.map(\.id).map(\.rawValue).joined(separator: ",")
        let c = constructors.map(\.id).map(\.rawValue).joined(separator: ",")
        return d + c
    }
    
    let drivers: [Driver]
    let constructors: [Constructor]
}

extension Team: Scorable {

    var shortName: String {
        let d = drivers.map(\.shortName).joined(separator: ",")
        let c = constructors.map(\.shortName).joined(separator: ",")
        return """
        \(d)
        \(c)
        """
    }

    var longName: String {
        let d = drivers.map(\.longName).joined(separator: ",")
        let c = constructors.map(\.longName).joined(separator: ",")
        return """
        \(d)
        \(c)
        """
    }

    var price: Double {
        let d = drivers.map(\.price).reduce(0, +)
        let c = constructors.map(\.price).reduce(0, +)
        return d + c
    }
    
    var points: Int? {
        let d = drivers.compactMap(\.points).reduce(0, +)
        let c = constructors.compactMap(\.points).reduce(0, +)
        return d + c
    }
}

extension Race {
    
    var teams: TeamSequence {
        TeamSequence(race: self)
    }
}

class TeamSequence: Sequence, IteratorProtocol {
    
    private let drivers: CombinationsSequence<[Driver]>
    private let constructors: CombinationsSequence<[Constructor]>
    
    private var dItr: CombinationsSequence<[Driver]>.Iterator
    private var cItr: CombinationsSequence<[Constructor]>.Iterator
    
    init(race: Race) {
        drivers = race.drivers.combinations(ofCount: 3)
        constructors = race.constructors.combinations(ofCount: 3)
        
        dItr = drivers.makeIterator()
        cItr = constructors.makeIterator()
    }
    
    private var currentDrivers: [Driver]?
    
    func next() -> Team? {
        
        if let c = cItr.next() {
            if let d = currentDrivers ?? dItr.next() {
                return Team(drivers: d, constructors: c)
            } else {
                return nil
            }
            
        } else {
            cItr = constructors.makeIterator()
                
            if let d = dItr.next(), let c = cItr.next() {
                currentDrivers = d
                return Team(drivers: d, constructors: c)
            } else {
                return nil
            }
        }
    }
}
