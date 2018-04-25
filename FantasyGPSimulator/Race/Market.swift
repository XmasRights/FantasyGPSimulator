//
//  Market.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 18/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

private struct MarketData: Codable
{
    let drivers: [String : Double]
    let cars:    [String : Double]
}

struct Market
{
    private let data: MarketData
    
    init?(location: Location, service: FantasyService)
    {
        let decoder = PropertyListDecoder()
        
        guard let data = Market.data(for: location, service: service) else { return nil }
        
        do {
            try decoder.decode(MarketData.self, from: data)
            
        } catch {
            print(error)
        }
        
        guard let decoded = try? decoder.decode(MarketData.self, from: data) else { return nil }
        
        self.data = decoded
    }
}

extension Market: PriceType
{
    func price(of driver: Driver) -> Price
    {
        guard let price = data.drivers[driver.rawValue]
            else { preconditionFailure() }
        return price
    }
    
    func price(of constructor: Constructor) -> Price
    {
        guard let price = data.cars[constructor.rawValue]
            else { preconditionFailure() }
        return price
    }
}

private extension Market
{
    static func url(for location: Location, service: FantasyService) -> URL?
    {
        switch service
        {
            case .FantasyGP:
                let name = "FGPPrice\(location.rawValue)"
                print(name)
                let result = Bundle.main.url(forResource: name, withExtension: "plist", subdirectory: "Data/FGPPrice")
                print(result)
                return result
        }
    }
    
    static func data(for location: Location, service: FantasyService) -> Data?
    {
        guard let url = url(for: location, service: service) else { return nil }
        
        do {
            try Data(contentsOf: url)
        } catch {
            print(error)
        }
        
        return try? Data(contentsOf: url)
    }
}
