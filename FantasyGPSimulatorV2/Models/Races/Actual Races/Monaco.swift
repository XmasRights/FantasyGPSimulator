//
//  Monaco.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 06/06/2021.
//

import Foundation

struct Monaco: Race {
    let location = Location.Monaco
    let info: RaceInfo = MonacoInfo()
    let result: RaceResult? = MonacoResult()
}

private struct MonacoResult: RaceResult {
    func qualifyingResult(for driver: Driver) -> Position {
        switch driver {
            case .verstappen: return .p(1)
            case .bottas: return .p(2)
            case .sainz: return .p(3)
            case .norris: return .p(4)
            case .gasly: return .p(5)
            case .hamilton: return .p(6)
            case .vettel: return .p(7)
            case .pérez: return .p(8)
            case .giovinazzi: return .p(9)
            case .ocon: return .p(10)
            case .ricciardo: return .p(11)
            case .stroll: return .p(12)
            case .räikkönen: return .p(13)
            case .russell: return .p(14)
            case .tsunoda: return .p(15)
            case .alonso: return .p(16)
            case .latifi: return .p(17)
            case .mazepin: return .p(18)
            case .schumacher: return .p(19)
            case .leclerc: return .retired
        }
    }
    
    func startingGrid(for driver: Driver) -> Position {
        switch driver {
            case .verstappen: return .p(1)
            case .bottas: return .p(2)
            case .sainz: return .p(3)
            case .norris: return .p(4)
            case .gasly: return .p(5)
            case .hamilton: return .p(6)
            case .vettel: return .p(7)
            case .pérez: return .p(8)
            case .giovinazzi: return .p(11)
            case .ocon: return .p(10)
            case .ricciardo: return .p(11)
            case .stroll: return .p(12)
            case .räikkönen: return .p(13)
            case .russell: return .p(14)
            case .tsunoda: return .p(15)
            case .alonso: return .p(16)
            case .latifi: return .p(17)
            case .mazepin: return .p(18)
            case .schumacher: return .p(19)
            case .leclerc: return .retired
        }
    }
    
    func raceResult(for driver: Driver) -> Position {
        switch driver {
            case .verstappen: return .p(1)
            case .sainz: return .p(2)
            case .norris: return .p(3)
            case .pérez: return .p(4)
            case .vettel: return .p(5)
            case .gasly: return .p(6)
            case .hamilton: return .p(7)
            case .stroll: return .p(8)
            case .ocon: return .p(9)
            case .giovinazzi: return .p(10)
            case .räikkönen: return .p(11)
            case .ricciardo: return .p(12)
            case .alonso: return .p(13)
            case .russell: return .p(14)
            case .latifi: return .p(15)
            case .tsunoda: return .p(14)
            case .mazepin: return .p(17)
            case .schumacher: return .p(18)
            case .bottas: return .retired
            case .leclerc: return .retired
        }
    }

    var fastestLap: Driver { .hamilton }
}

private struct MonacoInfo: RaceInfo {
    func cost(of driver: Driver) -> Double {
        switch driver {
            case .verstappen: return 23
            case .pérez:      return 18.5
            case .bottas:     return 18
            case .hamilton:   return 25
            case .leclerc:    return 15.5
            case .sainz:      return 15
            case .alonso:     return 11
            case .ocon:       return 10.4
            case .norris:     return 13
            case .ricciardo:  return 10
            case .vettel:     return 11.5
            case .stroll:     return 10
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
            case .haas:        return 4
        }
    }
}
