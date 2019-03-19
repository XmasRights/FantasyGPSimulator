//
//  TeamService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol TeamService: DriverService, ConstructorService { }

extension TeamService {
    
    var teams: [Team] {       
        let d = drivers.uniquePermutations(filter: { $0.count == 3 })
        let c = constructors.uniquePermutations(filter: { $0.count == 3 })
        return product(c, d)
    }
    
    func teams(budget: ClosedRange<Price>) -> [Team] {
        return teams.filter { budget.contains($0.price) }
    }
    
    func f15teams(budget: ClosedRange<Price>) -> [Team] {
        return f15Teams.filter { budget.contains($0.price) }
    }
    
    func drivers(in constructor: Constructor) -> [Driver] {
        return drivers(in: constructor.identifier)
    }
    
    func drivers(in constructor: ConstructorId) -> [Driver] {
        return drivers.filter { $0.constructor == constructor }
    }
    
    func teammate(of driver: Driver) -> Driver {
        let team = drivers(in: driver.constructor)
        return team.first(where: { $0 != driver })!
    }
}

// Formula 1.5
extension TeamService {
    private var elites: Set<ConstructorId> {
        return [.Mercedes, .Ferarri, .RedBull]
    }
    
    var f15drivers: [Driver] {
        return drivers.filter { !elites.contains($0.constructor) }
    }
    
    var f15Constructors: [Constructor] {
        return constructors.filter { !elites.contains($0.identifier) }
    }
    
    var f15Teams: [Team] {
        let d = f15drivers.uniquePermutations(filter: { $0.count == 3 })
        let c = f15Constructors.uniquePermutations(filter: { $0.count == 3 })
        return product(c, d)
    }
}

private extension TeamService {
    
    private func product(_ constructors: [[Constructor]],
                         _ drivers: [[Driver]])
        -> [Team] {
            
            return constructors.map { constructor in
                return drivers.map { driver in
                    return Team(drivers: Set(driver), constructors: Set(constructor))
                }
                }.flatMap { $0 }
    }
}

