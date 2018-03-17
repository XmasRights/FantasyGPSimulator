//
//  TeamType.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 17/03/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol TeamType
{
    func team(of driver: Driver) -> Constructor
    func teammate(of driver: Driver) -> Driver
}
