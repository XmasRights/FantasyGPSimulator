//
//  Race.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

typealias Price = Double
typealias Score = Int

protocol Race
{
    // MARK: Driver Data
    func team(of driver: Driver) -> Constructor
    func teammate(of driver: Driver) -> Driver
    
    // MARK: Price Data
    func price(of driver: Driver) -> Price
    func price(of constructor: Constructor) -> Price
    
    // MARK: Score Data
    func score(for team: Team) -> Score
}
