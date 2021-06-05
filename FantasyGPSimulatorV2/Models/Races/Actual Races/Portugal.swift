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
    let result: RaceResult? = _PortugalResult()
}

private struct _PortugalResult: RaceResult {
    func qualifyingResult(for driver: Driver) -> Position {
        switch driver {
            case .bottas: return .p(1)
            case .hamilton: return .p(2)
            case .verstappen: return .p(3)
            case .pérez: return .p(4)
            case .sainz: return .p(5)
            case .ocon: return .p(6)
            case .norris: return .p(7)
            case .leclerc: return .p(8)
            case .gasly: return .p(9)
            case .vettel: return .p(10)
            case .russell: return .p(11)
            case .giovinazzi: return .p(12)
            case .alonso: return .p(13)
            case .tsunoda: return .p(14)
            case .räikkönen: return .p(15)
            case .ricciardo: return .p(16)
            case .stroll: return .p(17)
            case .latifi: return .p(18)
            case .schumacher: return .p(19)
            case .mazepin: return .p(20)
        }
    }
    
    func startingGrid(for driver: Driver) -> Position {
        switch driver {
            case .bottas: return .p(1)
            case .hamilton: return .p(2)
            case .verstappen: return .p(3)
            case .pérez: return .p(4)
            case .sainz: return .p(5)
            case .ocon: return .p(6)
            case .norris: return .p(7)
            case .leclerc: return .p(8)
            case .gasly: return .p(9)
            case .vettel: return .p(10)
            case .russell: return .p(11)
            case .giovinazzi: return .p(12)
            case .alonso: return .p(13)
            case .tsunoda: return .p(14)
            case .räikkönen: return .p(15)
            case .ricciardo: return .p(16)
            case .stroll: return .p(17)
            case .latifi: return .p(18)
            case .schumacher: return .p(19)
            case .mazepin: return .p(20)
        }
    }
    
    func raceResult(for driver: Driver) -> Position {
        switch driver {
            case .hamilton: return .p(1)
            case .verstappen: return .p(2)
            case .bottas: return .p(3)
            case .pérez: return .p(4)
            case .norris: return .p(5)
            case .leclerc: return .p(6)
            case .ocon: return .p(7)
            case .alonso: return .p(8)
            case .ricciardo: return .p(9)
            case .gasly: return .p(10)
            case .sainz: return .p(11)
            case .giovinazzi: return .p(12)
            case .vettel: return .p(13)
            case .stroll: return .p(14)
            case .tsunoda: return .p(15)
            case .russell: return .p(16)
            case .schumacher: return .p(17)
            case .latifi: return .p(18)
            case .mazepin: return .p(19)
            case .räikkönen: return .retired
        }
    }

    var fastestLap: Driver { .bottas }
}

private struct _PortugalInfo: RaceInfo {
    func cost(of driver: Driver) -> Double {
        switch driver {
            case .verstappen: return 23.0
            case .pérez:      return 18.5
            case .bottas:     return 18.0
            case .hamilton:   return 25.0
            case .leclerc:    return 15.5
            case .sainz:      return 15.0
            case .alonso:     return 11.0
            case .ocon:       return 10.5
            case .norris:     return 13.0
            case .ricciardo:  return 10.0
            case .vettel:     return 11.5
            case .stroll:     return 10.0
            case .räikkönen:  return 5.5
            case .giovinazzi: return 6.0
            case .tsunoda:    return 4.5
            case .gasly:      return 7.5
            case .latifi:     return 3.5
            case .russell:    return 5.5
            case .schumacher: return 3.5
            case .mazepin:    return 3.5
        }
    }

    func cost(of constructor: Constructor) -> Double {
        switch constructor {
            case .redBull:     return 23
            case .mercedes:    return 25.5
            case .ferrari:     return 16.5
            case .alpine:      return 12
            case .mcLaren:     return 15
            case .astonMartin: return 13
            case .alfaRomeo:   return 5.5
            case .alphaTauri:  return 8.0
            case .williams:    return 4.5
            case .haas:        return 4.0
        }
    }
}
