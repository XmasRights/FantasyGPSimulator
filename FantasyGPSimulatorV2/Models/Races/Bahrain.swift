//
//  Bahrain.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

struct Bahrain: Race {
    let name = "Bahrain Grand Prix"

    func qualifyingResult(for driver: Driver) -> RaceResult {
        switch driver {
            case .verstappen: return .p(1)
            case .hamilton:   return .p(2)
            case .bottas:     return .p(3)
            case .leclerc:    return .p(4)
            case .gasly:      return .p(5)
            case .ricciardo:  return .p(6)
            case .norris:     return .p(7)
            case .sainz:      return .p(8)
            case .alonso:     return .p(9)
            case .stroll:     return .p(10)
            case .pérez:      return .p(11)
            case .giovinazzi: return .p(12)
            case .tsunoda:    return .p(13)
            case .räikkönen:  return .p(14)
            case .russell:    return .p(15)
            case .ocon:       return .p(16)
            case .latifi:     return .p(17)
            case .vettel:     return .p(18)
            case .schumacher: return .p(19)
            case .mazepin:    return .p(20)
        }
    }

    func startingGrid(for driver: Driver) -> RaceResult {
        switch driver {
            case .verstappen: return .p(1)
            case .hamilton:   return .p(2)
            case .bottas:     return .p(3)
            case .leclerc:    return .p(4)
            case .gasly:      return .p(5)
            case .ricciardo:  return .p(6)
            case .norris:     return .p(7)
            case .sainz:      return .p(8)
            case .alonso:     return .p(9)
            case .stroll:     return .p(10)
            case .giovinazzi: return .p(12)
            case .tsunoda:    return .p(12)
            case .räikkönen:  return .p(13)
            case .russell:    return .p(14)
            case .ocon:       return .p(15)
            case .latifi:     return .p(17)
            case .schumacher: return .p(17)
            case .vettel:     return .p(19)
            case .pérez:      return .p(20)
            case .mazepin:    return .p(20)
        }
    }

    func raceResult(for driver: Driver) -> RaceResult {
        switch driver {
            case .hamilton:   return .p(1)
            case .verstappen: return .p(2)
            case .bottas:     return .p(3)
            case .norris:     return .p(4)
            case .pérez:      return .p(5)
            case .leclerc:    return .p(6)
            case .ricciardo:  return .p(7)
            case .sainz:      return .p(8)
            case .tsunoda:    return .p(9)
            case .stroll:     return .p(10)
            case .räikkönen:  return .p(11)
            case .giovinazzi: return .p(12)
            case .ocon:       return .p(13)
            case .russell:    return .p(14)
            case .vettel:     return .p(15)
            case .schumacher: return .p(16)
            case .gasly:      return .retired
            case .latifi:     return .retired
            case .alonso:     return .retired
            case .mazepin:    return .retired
        }
    }

    var fastestLap: Driver { .bottas }

    func cost(of driver: Driver) -> Double {
        switch driver {
            case .hamilton:   return 25.5
            case .bottas:     return 19.5
            case .verstappen: return 20.5
            case .pérez:      return 17.5
            case .räikkönen:  return 6.5
            case .giovinazzi: return 5.5
            case .gasly:      return 7.5
            case .tsunoda:    return 4.0
            case .alonso:     return 11.5
            case .ocon:       return 9.5
            case .vettel:     return 12.5
            case .stroll:     return 9.0
            case .leclerc:    return 16.0
            case .sainz:      return 14.5
            case .mazepin:    return 3.0
            case .schumacher: return 4.0
            case .ricciardo:  return 12.0
            case .norris:     return 10.5
            case .latifi:     return 4.5
            case .russell:    return 5.5
        }
    }

    func cost(of constructor: Constructor) -> Double {
        switch constructor {
            case .mercedes:    return 27.5
            case .redBull:     return 20
            case .ferrari:     return 15.5
            case .mcLaren:     return 14
            case .astonMartin: return 13.5
            case .alpine:      return 12
            case .alphaTauri:  return 7.5
            case .alfaRomeo:   return 5.5
            case .haas:        return 4.5
            case .williams:    return 4.5
        }
    }
}
