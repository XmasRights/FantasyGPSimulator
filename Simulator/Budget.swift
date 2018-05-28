//
//  Budget.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 28/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct Budget
{
    let min: Price
    let max: Price
    
    init(min: Price, max: Price)
    {
        precondition(min <= max)
        
        self.min = min
        self.max = max
    }
}
