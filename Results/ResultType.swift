//
//  ResultType.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

enum Position
{
    case DNF
    case Position(Int)
}

extension Position
{
    init(value: Int)
    {
        switch value
        {
        case 0:  self = .DNF
        default: self = .Position(value)
        }
    }
}

protocol ResultType
{
    func qualifyingPosition(for driver: Driver) -> Position
    func finishingPosition(for driver: Driver) -> Position
}
