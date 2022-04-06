//
//  RaceCalendar.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

struct RaceCalendar {
    let races: [GrandPrix]
}

struct GrandPrix: Identifiable {
    var id: String { name }
    
    let flag: String
    let name: String
    
    let data: Race?
}
