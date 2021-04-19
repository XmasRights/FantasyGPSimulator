//
//  Portugal.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import Foundation

struct Portugal: Race {
    let location = Location.Portugal
    let info: RaceInfo = _PortugalInfo()
    let result: RaceResult? = nil
}

private struct _PortugalInfo: RaceInfo {
    func cost(of driver: Driver) -> Double {
        switch driver {
            case .hamilton:   return 25.5
            case .verstappen: return 21.5
            case .bottas:     return 18.5
            case .pérez:      return 17.5
            case .räikkönen:  return 6.5
            case .giovinazzi: return 5.5
            case .gasly:      return 6.5
            case .tsunoda:    return 5.0
            case .alonso:     return 10.5
            case .ocon:       return 9.5
            case .vettel:     return 11.5
            case .stroll:     return 9.0
            case .leclerc:    return 16.0
            case .sainz:      return 15.0
            case .mazepin:    return 2.5
            case .schumacher: return 3.5
            case .ricciardo:  return 11.0
            case .norris:     return 11.5
            case .latifi:     return 4.0
            case .russell:    return 5.5
        }
    }

    func cost(of constructor: Constructor) -> Double {
        switch constructor {
            case .mercedes:    return 26.5
            case .redBull:     return 21.5
            case .ferrari:     return 15.5
            case .mcLaren:     return 15
            case .astonMartin: return 13
            case .alpine:      return 11
            case .alphaTauri:  return 9.0
            case .alfaRomeo:   return 5.5
            case .haas:        return 4.0
            case .williams:    return 5.0
        }
    }
}
