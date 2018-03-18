//
//  ViewController.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let loader = PlistRaceDataLoader(location: .Australia) else { preconditionFailure() }
        let race = Race(loader: loader)
        print(race.prices.price(of: Driver.Ricciardo))
        
        print(race.scores?.score(for: Driver.Ricciardo))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

