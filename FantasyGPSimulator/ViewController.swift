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

        let drivers = data.leaderboard(for: Driver.allValues)
        let const   = data.leaderboard(for: Constructor.allValues)

        print("--- DRIVERS ---")
        drivers.forEach { score, driver in print("\(driver) -> \(score) -> \(locations.map { loc in data.score(for: driver, at: loc) })") }
        print("\n")

        print("--- CONSTRUCTORS ---")
        const.forEach { score, con in print("\(con) -> \(score) -> \(locations.map { loc in data.score(for: con, at: loc) })") }
        print("\n")
        
        let selections = Selection.selections
        {   selection in
            
            let min = Price(70)
            let max = Price(75)
            
            let minPerRaceScore = 100
            
            let price = data.price(of: selection)
            let inBudget = min < price && price <= max
            
            let raceScores = locations.map { data.score(for: selection, at: $0) }
            let reliableScore = raceScores.filter { $0 < minPerRaceScore }.isEmpty
            
            return inBudget && reliableScore
        }

        let details = selections.map
        {   selection -> (price: Price, score: Score, team: Selection, breakdown: [Score]) in

            return (data.price(of: selection),
                    data.score(for: selection),
                    selection,
                    locations.map { data.score(for: selection, at: $0) })
        }

        details.sorted(by: { $0.score < $1.score }).forEach { print($0) }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

