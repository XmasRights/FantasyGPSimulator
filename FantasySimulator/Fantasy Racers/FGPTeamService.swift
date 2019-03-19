//
//  FGPTeamService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FGPTeamService: TeamService {
    
    var drivers: [Driver]
    
    var constructors: [Constructor]
    
    init(location: Location) throws {
        self.drivers = try FGPDriverService(location: location).drivers
        self.constructors = try FGPConstructorService(location: location).constructors
    }
}
