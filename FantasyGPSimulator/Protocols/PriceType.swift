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
}
