//
//  ResultType.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
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
