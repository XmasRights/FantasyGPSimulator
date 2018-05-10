//
//  TeamFactory.swift
//  FantasyGPSimulator
//
//  Created by Christopher Fonseka on 29/04/2018.
//  Copyright © 2018 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Team
{
    static func team(at location: Location) throws
    {
        do
        {
            let data: TeamRawData = try PlistLoader.load(resource: "Default", subdirectory: "Data/Team")
            print(data)
        }
        catch
        {
            throw error
        }
    }
}

private struct TeamRawData: Codable
{
    let data: [Constructor : [Driver]]
}


