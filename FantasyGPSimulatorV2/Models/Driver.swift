//
//  Driver.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

enum Driver: CaseIterable {
    case hamilton
    case bottas
    case verstappen
    case pérez
    case räikkönen
    case giovinazzi
    case gasly
    case tsunoda
    case alonso
    case ocon
    case vettel
    case stroll
    case leclerc
    case sainz
    case mazepin
    case schumacher
    case ricciardo
    case norris
    case latifi
    case russell
}

extension Driver: Displayable {
    var displayName: String {
        switch self {
            case .hamilton:   return "Sir Lewis Hamilton"
            case .bottas:     return "Valtteri Bottas"
            case .verstappen: return "Max Verstappen"
            case .pérez:      return "Sergio Pérez"
            case .räikkönen:  return "Kimi Räikkönen"
            case .giovinazzi: return "Antonio Giovinazzi"
            case .gasly:      return "Pierre Gasly"
            case .tsunoda:    return "Yuki Tsunoda"
            case .alonso:     return "Fernando Alonso"
            case .ocon:       return "Esteban Ocon"
            case .vettel:     return "Sebastian Vettel"
            case .stroll:     return "Lance Stroll"
            case .leclerc:    return "Charles Leclerc"
            case .sainz:      return "Carlos Sainz Jr"
            case .mazepin:    return "Nikita Mazepin"
            case .schumacher: return "Mick Schumacher"
            case .ricciardo:  return "Daniel Ricciardo"
            case .norris:     return "Lando Norris"
            case .latifi:     return "Nicholas Latifi"
            case .russell:    return "George Russell"
        }
    }

    var shortName: String {
        switch self {
            case .hamilton:   return "HAM"
            case .bottas:     return "BOT"
            case .verstappen: return "VER"
            case .pérez:      return "PER"
            case .räikkönen:  return "RAI"
            case .giovinazzi: return "GIO"
            case .gasly:      return "GAS"
            case .tsunoda:    return "TSU"
            case .alonso:     return "ALO"
            case .ocon:       return "OCO"
            case .vettel:     return "VET"
            case .stroll:     return "STR"
            case .leclerc:    return "LEC"
            case .sainz:      return "SAI"
            case .mazepin:    return "MAZ"
            case .schumacher: return "MSC"
            case .ricciardo:  return "RIC"
            case .norris:     return "NOR"
            case .latifi:     return "LAT"
            case .russell:    return "RUS"
        }
    }
}
