//
//  ViewController.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let locations: [Location] = [.Australia, .Bahrain, .China]//
        let data = RaceGroup(locations: locations)
//
        let drivers = data.leaderboard(for: Driver.allValues)
        let const   = data.leaderboard(for: Constructor.allValues)
//
        print("--- DRIVERS ---")
        drivers.forEach { score, driver in print("\(driver) -> \(score) -> \(locations.map { loc in data.score(for: driver, at: loc) })") }
        print("\n")

        print("--- CONSTRUCTORS ---")
        const.forEach { score, con in print("\(con) -> \(score) -> \(locations.map { loc in data.score(for: con, at: loc) })") }
        print("\n")
        
//        let selections = Selection.selections
//        {
//            let price = race.price(of: $0)
//            let score = race.score(for: $0)
//            return 68 < price
//                   && price <= 75
//                   && score > 350
//                   && $0.constructors.contains(.Mercedes)
//                   && $0.constructors.contains(.Ferrari)
//                   && $0.constructors.contains(.RedBull)
//        }
//
//        let details = selections.map
//        {   selection -> (price: Price, score: Score, team: Selection) in
//
//            return (race.price(of: selection),
//                    race.score(for: selection),
//                    selection)
//        }
//
//        details.sorted(by: { $0.score < $1.score }).forEach { print($0) }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

