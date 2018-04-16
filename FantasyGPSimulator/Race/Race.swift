//
//  Race.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Race
{
    private let prices: PriceType
    private let scores: ScoreType?
    
    init(loader: RaceDataLoader)
    {
        self.prices = loader.priceData
        self.scores = loader.scoreData
    }
}

extension Race: PriceType
{
    func price(of constructor: Constructor) -> Price
    {
        return prices.price(of: constructor)
    }
    
    func price(of driver: Driver) -> Price
    {
        return prices.price(of: driver)
    }
}

extension Race: ScoreType
{
    func score(for driver: Driver) -> Score
    {
        return scores?.score(for: driver) ?? 0
    }
    
    func score(for constructor: Constructor) -> Score
    {
        return scores?.score(for: constructor) ?? 0
    }
}
