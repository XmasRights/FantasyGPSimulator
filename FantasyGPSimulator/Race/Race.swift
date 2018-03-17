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
    let prices: PriceType
    let scores: ScoreType
    
    init(loader: RaceDataLoader, location: Location)
    {
        self.prices = loader.priceData(for: location)
        self.scores = loader.scoreData(for: location)
    }
}
