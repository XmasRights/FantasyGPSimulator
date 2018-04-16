//
//  RaceGroup.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 16/04/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct RaceGroup
{
    private let data: [Location : Race]
    
    init(locations: [Location])
    {
        self.data = locations.reduce(into: [:]) { data, loc in
            guard let loader = PlistRaceDataLoader(location: loc) else { return }
            data[loc] = Race(loader: loader)
        }
    }
}

private extension RaceGroup
{
    var races: [Race]
    {
        return Array(data.values)
    }
}

extension RaceGroup: PriceType
{
    func price(of constructor: Constructor) -> Price
    {
        return races.reduce(0) { max($0, $1.price(of: constructor)) }
    }
    
    func price(of driver: Driver) -> Price
    {
        return races.reduce(0) { max($0, $1.price(of: driver)) }
    }
}

extension RaceGroup: ScoreType
{
    func score(for constructor: Constructor) -> Score
    {
        return races.reduce(0) { $0 + $1.score(for: constructor) }
    }
    
    func score(for constructor: Constructor, at race: Location) -> Score
    {
        return data[race]?.score(for: constructor) ?? 0
    }
    
    func score(for driver: Driver) -> Score
    {
        return races.reduce(0) { $0 + $1.score(for: driver) }
    }
    
    func score(for driver: Driver, at race: Location) -> Score
    {
        return data[race]?.score(for: driver) ?? 0
    }
}
