//
//  MarketType.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

typealias Price = Double

protocol MarketType
{
    func price(of driver: Driver) -> Price
    func price(of constructor: Constructor) -> Price
    func price(of selection: Selection) -> Price
}

extension MarketType
{
    func price(of selection: Selection) -> Price
    {
        let drivers      = selection.drivers     .reduce(0, { $0 + price(of: $1) })
        let constructors = selection.constructors.reduce(0, { $0 + price(of: $1) })
        return drivers + constructors
    }
}

