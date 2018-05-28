//
//  TeamType.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

protocol TeamType
{
    func team(of driver: Driver) -> Constructor?
    func teammate(of driver: Driver) -> Driver?
    
    func drivers(in constructor: Constructor) -> Set<Driver>
}
