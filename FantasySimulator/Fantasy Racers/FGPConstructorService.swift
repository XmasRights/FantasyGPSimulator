//
//  FGPConstructorService.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

struct FGPConstructorService: ConstructorService {
    
    var constructors: [Constructor]
    
    // TODO: Move to FileDecoder
    static private let path = "/Users/christopherfonseka/Code/FantasyGPSimulator/FantasySimulator/Fantasy Racers/Constructors/"
    
    init(location: Location) throws {
        let decoder = PropertyListDecoder()
        
        let url = URL(fileURLWithPath: FGPConstructorService.path + location.rawValue + ".plist")
        
        do {
            let data = try Data(contentsOf: url)
            let result = try decoder.decode([Constructor].self, from: data)
            self.constructors = result
        } catch {
            throw error
        }
    }
}
