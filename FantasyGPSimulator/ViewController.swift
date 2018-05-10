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

        do
        {
            let teams = try Team.team(at: .Australia)
            
            print(teams.drivers(in: .Ferrari))
            print(teams.drivers(in: .RedBull))
            print(teams.drivers(in: .ToroRosso))
            
        }
        catch
        {
            print("ERROR \(error)")
        }
        
//        print("Start")
//
//        guard let aus = Result(location: .Australia) else { preconditionFailure() }
//        guard let bah = Result(location: .Bahrain) else { preconditionFailure() }
//        guard let cna = Result(location: .China) else { preconditionFailure() }
//
//        let scoring = [aus, bah, cna].map { F1Score(teamData: $0, resultData: $0) }
//
//        print("Scoring Initialised")
        
//        let drivers = scoring.leaderboard(for: Driver.allValues)
//        let const   = scoring.leaderboard(for: Constructor.allValues)
//
//        print("--- DRIVERS ---")
//        drivers.forEach { score, driver in print("\(driver) -> \(score)") }
//        print("\n")
//
//        print("--- CONSTRUCTORS ---")
//        const.forEach { score, con in print("\(con) -> \(score)") }
//        print("\n")
        
//        guard let market = Market(location: .Australia, service: .Formula1) else { preconditionFailure() }
//
//        print("Market Initialised")
//
//        let selections = Selection.selectionsIncluding(drivers: 5, constructors: 1)
//        {   selection in
//
//            let min = Price(90)
//            let max = Price(100)
//
//            let minPerRaceScore = 160
//
//            let price = market.price(of: selection)
//            let scores = scoring.map { $0.score(for: selection) }
//
//            let inBudget = min < price && price <= max
//            let reliableScores = scores.filter { $0 < minPerRaceScore }.isEmpty
//
//            return inBudget && reliableScores
//        }
//
//        print("\(selections.count) Made")
//
//        let details = selections.map
//        {   selection -> (price: Price, score: Score, team: Selection, breakdown: [Score]) in
//
//            return (market.price(of: selection),
//                    scoring.reduce(0) { $0 +  $1.score(for: selection) },
//                    selection,
//                    scoring.map { $0.score(for: selection) })
//        }
//
//        print("Details Extracted")
//
//        details.sorted(by: { $0.score < $1.score }).forEach { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

