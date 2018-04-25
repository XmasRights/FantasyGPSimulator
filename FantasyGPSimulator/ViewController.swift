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

        
        let location: Location = .Australia
        
        guard let result = Result(location: location) else { preconditionFailure() }

        let scoring = FGPScore(teamData: result, resultData: result)

        let drivers = scoring.leaderboard(for: Driver.allValues)
        let const   = scoring.leaderboard(for: Constructor.allValues)

        print("--- DRIVERS ---")
        drivers.forEach { score, driver in print("\(driver) -> \(score)") }
        print("\n")

        print("--- CONSTRUCTORS ---")
        const.forEach { score, con in print("\(con) -> \(score)") }
        print("\n")
        
        guard let market = Market(location: location, service: .FantasyGP) else { preconditionFailure() }

        let selections = Selection.selections
        {   selection in
            
            let min = Price(70)
            let max = Price(75)
            
            let minPerRaceScore = 120
            
            let price = market.price(of: selection)
            let score = scoring.score(for: selection)
            
            let inBudget = min < price && price <= max
            
            return inBudget && (score > minPerRaceScore)
        }

        let details = selections.map
        {   selection -> (price: Price, score: Score, team: Selection) in

            return (market.price(of: selection),
                    scoring.score(for: selection),
                    selection)
        }

        details.sorted(by: { $0.score < $1.score }).forEach { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

