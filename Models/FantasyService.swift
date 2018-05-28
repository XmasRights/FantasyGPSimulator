//
//  FantasyService.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

enum FantasyService
{
    case FantasyGP
    case Formula1
}

extension FantasyService: SelectionSpec
{
    var driverCount: Int
    {
        switch self
        {
            case .FantasyGP: return 3
            case .Formula1:  return 5
        }
    }
    
    var constructorCount: Int
    {
        switch self
        {
            case .FantasyGP: return 3
            case .Formula1:  return 1
        }
    }
}

