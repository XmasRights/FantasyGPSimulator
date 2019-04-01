//
//  FGPDriverService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FGPDriverService: DriverService {
    
    let drivers: [Driver]
    
    static let path = "/Users/christopherfonseka/Code/FantasyGPSimulator/FantasySimulator/Fantasy Racers/Drivers/"
    
    init(location: Location) throws {
        let decoder = PropertyListDecoder()
        
        let url = URL(fileURLWithPath: FGPDriverService.path + location.rawValue + ".plist")
        
        do {
            let data = try Data(contentsOf: url)
            let result = try decoder.decode([Driver].self, from: data)
            self.drivers = result
        } catch {
            throw error
        }
    }
}
