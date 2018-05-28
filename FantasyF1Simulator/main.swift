//
//  main.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

//print("/n-------- Team Test -------")
//do
//{
//    let teams = try Team.teams(at: .Australia)
//    print(teams)
//}
//catch { print(error) }
//
//print("/n-------- Result Test -------")
//do
//{
//    let result = try Result.result(at: .Australia)
//    print(result)
//}
//catch { print(error) }
//
//print("/n-------- Market Test -------")
//do
//{
//    let result = try Market.prices(at: .Australia, using: .FantasyGP)
//    print(result)
//}
//catch { print(error) }
//
//print("/n-------- Selection Test -------")
//
//do
//{
//    let market = try Market.prices(at: .Australia, using: .FantasyGP)
//
//    let selections = Selection.selectionsIncluding(using: FantasyService.FantasyGP)
//    {
//        let price = market.price(of: $0)
//        return 60 < price && price < 66
//    }
//
//    print(selections)
//}

do
{
    let location = Location.Australia
    
    let leaderboard = try Simulator.generateDriverLeaderboard(for: location, using: .FantasyGP)
    
    for item in leaderboard
    {
        print(item)
    }
    
} catch { print(error) }



