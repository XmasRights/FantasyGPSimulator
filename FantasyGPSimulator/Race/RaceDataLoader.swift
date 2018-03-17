//
//  RaceDataLoader.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol RaceDataLoader
{
    func priceData(for location: Location) -> PriceType
    func scoreData(for location: Location) -> ScoreType
}