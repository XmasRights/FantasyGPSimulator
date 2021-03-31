//
//  Race.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

enum RaceResult {
    case p(Int)
    case retired
}

protocol Race {
    var name: String { get }

    // Result
    func qualifyingResult(for: Driver) -> RaceResult
    func startingGrid(for: Driver) -> RaceResult
    func raceResult(for: Driver) -> RaceResult
    var fastestLap: Driver { get }

    // Entries
    func teammate(of: Driver) -> Driver
    func constructor(of: Driver) -> Constructor
    func cost(of: Driver) -> Double
    func cost(of: Constructor) -> Double
}

enum Races {
    static let all: [Race] = [
        Bahrain()
    ]
}

extension Race {
    func teammate(of driver: Driver) -> Driver {
        switch driver {
            case .hamilton:   return .bottas
            case .bottas:     return .hamilton
            case .verstappen: return .pérez
            case .pérez:      return .verstappen
            case .räikkönen:  return .giovinazzi
            case .giovinazzi: return .räikkönen
            case .gasly:      return .tsunoda
            case .tsunoda:    return .gasly
            case .alonso:     return .ocon
            case .ocon:       return .alonso
            case .vettel:     return .stroll
            case .stroll:     return .vettel
            case .leclerc:    return .sainz
            case .sainz:      return .leclerc
            case .mazepin:    return .schumacher
            case .schumacher: return .mazepin
            case .ricciardo:  return .norris
            case .norris:     return .ricciardo
            case .latifi:     return .russell
            case .russell:    return .latifi
        }
    }

    func constructor(of driver: Driver) -> Constructor {
        switch driver {
            case .hamilton, .bottas: return .mercedes
            case .verstappen, .pérez: return .redBull
            case .räikkönen, .giovinazzi: return .alfaRomeo
            case .gasly, .tsunoda: return .alphaTauri
            case .alonso, .ocon: return .alpine
            case .vettel, .stroll: return .astonMartin
            case .leclerc, .sainz: return .ferrari
            case .mazepin, .schumacher: return .haas
            case .ricciardo, .norris: return .mcLaren
            case .latifi, .russell: return .williams
        }
    }

    func drivers(for constructor: Constructor) -> [Driver] {
        Driver.allCases.filter { driver in
            self.constructor(of: driver) == constructor
        }
    }
}
