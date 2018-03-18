//
//  PlistPrice.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct PlistPrice
{
    // TODO Validate Data
    let drivers: [String : String]
    let cars:    [String : String]
}

extension PlistPrice: PriceType
{
    func price(of driver: Driver) -> Price
    {
        guard let priceString = drivers[driver.rawValue],
              let price = Double(priceString)
            else { preconditionFailure() }
        return price
    }
    
    func price(of constructor: Constructor) -> Price
    {
        guard let priceString = cars[constructor.rawValue],
            let price = Double(priceString)
            else { preconditionFailure() }
        return price
    }
}
