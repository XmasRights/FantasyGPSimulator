//
//  File.swift
//  FantasyF1Simulator
//
//  Created by Christopher Fonseka on 26/05/2018.
//  Copyright © 2018 christopherFonseka. All rights reserved.
//

import Foundation

struct File
{
    private static let root = "/Users/christopherfonseka/Code/FantasyF1Sim/Data/"
    
    static var teamData: String
    {
        return root + "Team/Default.plist"
    }
    
    static func raceData(at location: Location) -> String
    {
        return root + "Race/\(location.rawValue).plist"
    }
    
    static func priceData(at location: Location, using service: FantasyService) -> String
    {
        switch service
        {
            case .FantasyGP:
                return root + "Price/FGP/\(location.rawValue).plist"
            
            case .Formula1:
                return root + "Price/F1/Default.plist"
        }
    }
}
