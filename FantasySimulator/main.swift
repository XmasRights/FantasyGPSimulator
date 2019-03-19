//
//  main.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 11/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

do {
    print("START")
    let location = Location.Australia
    
//    try Printer.FGPDriverScores(at: location)
//    print("----------------------------------------")
//    try Printer.FGPConstructorScores(at: location)
//    print("----------------------------------------")
//
//    try Printer.FGPScoreboard(budget: (70...75),
//                              minScore: 135,
//                              location: location)
    
    try Printer.FGPF15Scoreboard(budget: (0...75),
                                 minScore: 80,
                                 location: location)
    
//    try Printer.FGPF15Scoreboard(budget: (40...75), minScore: 60, location: location)
    print("✅")
    
} catch {
    print(error)
}
