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

        guard let loader = PlistRaceDataLoader(location: .Bahrain) else { preconditionFailure() }
        let race = Race(loader: loader)

        guard let scores = race.scores else { preconditionFailure() }
        
        let drivers = scores.leaderboard(for: Driver.allValues)
        let const   = scores.leaderboard(for: Constructor.allValues)
        
        print("--- DRIVERS ---")
        drivers.forEach { print("\($0.0) -> \($0.1)") }
        print("\n")
        
        print("--- CONSTRUCTORS ---")
        const.forEach { print("\($0.0) -> \($0.1)") }
        print("\n")
        
        let selections = Selection.selections
        {
            let price = race.price(of: $0)
            let score = race.scores!.score(for: $0)
            return 68 < price && price <= 75 && score > 130
        }

        let details = selections.map
        {   selection -> (price: Price, score: Score, team: Selection) in

            return (race.price(of: selection),
                    race.scores!.score(for: selection),
                    selection)
        }

        details.sorted(by: { $0.score < $1.score }).forEach { print($0) }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

