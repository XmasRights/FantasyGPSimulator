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
        
        let selections = Selection.selections
        {
            let price = race.prices.price(of: $0)
            return 72 < price && price <= 75
        }
    
        selections.forEach { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

