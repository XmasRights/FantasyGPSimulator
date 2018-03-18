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
    case DNS
    case DNF
    case Position(Int)
}

protocol ResultType
{
    func qualifyingPosition(for driver: Driver) -> Position
    func finishingPosition(for driver: Driver) -> Position
}
