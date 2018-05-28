//
//  Market.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Market
{
    static func prices(at location: Location, using service: FantasyService) throws -> MarketType
    {
        do
        {
            let path = File.priceData(at: location, using: service)
            let data: MarketImp = try PlistLoader.load(path: path)
            return data
        }
        catch { throw error }
    }
}

private struct MarketImp: Codable
{
    let drivers: [String : Double]
    let cars:    [String : Double]
}

extension MarketImp: MarketType
{
    func price(of driver: Driver) -> Price
    {
        guard let price = drivers[driver.rawValue]
            else { preconditionFailure() }
        return price
    }
    
    func price(of constructor: Constructor) -> Price
    {
        guard let price = cars[constructor.rawValue]
            else { preconditionFailure() }
        return price
    }
}
