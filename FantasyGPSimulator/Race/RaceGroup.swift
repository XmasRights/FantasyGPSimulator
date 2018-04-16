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
    private let races: [Race]
    
    init(loaders: [RaceDataLoader])
    {
        self.races = loaders.map { Race(loader: $0) }
    }
}

extension RaceGroup: PriceType
{
    func price(of constructor: Constructor) -> Price
    {
        return races.reduce(0) { $0 + $1.price(of: constructor) }
    }
    
    func price(of driver: Driver) -> Price
    {
        return races.reduce(0) { $0 + $1.price(of: driver) }
    }
}

extension RaceGroup: ScoreType
{
    func score(for constructor: Constructor) -> Score
    {
        return races.reduce(0) { $0 + $1.score(for: constructor) }
    }
    
    func score(for driver: Driver) -> Score
    {
        return races.reduce(0) { $0 + $1.score(for: driver) }
    }
}
