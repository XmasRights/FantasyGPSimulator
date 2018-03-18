//
//  PriceType.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

typealias Price = Double

protocol PriceType
{
    func price(of driver: Driver) -> Price
    func price(of constructor: Constructor) -> Price
    func price(of selection: Selection) -> Price
}

extension PriceType
{
    func price(of selection: Selection) -> Price
    {
        let drivers      = selection.drivers     .reduce(0, { $0 + price(of: $1) })
        let constructors = selection.constructors.reduce(0, { $0 + price(of: $1) })
        return drivers + constructors
    }
}
