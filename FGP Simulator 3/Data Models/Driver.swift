//
//  Driver.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

struct Driver: Identifiable, Hashable, Scorable {
    var id: Name { name }
    
    let name: Name
    let price: Double
    let points: Int?
    
    var shortName: String { self.name.shortName }
    var longName: String { self.name.longName }
}

extension Driver {
    
    enum Name: String {
        case verstappen
        case perez
        case russell
        case hamilton
        case leclerc
        case sainz
        case alonso
        case ocon
        case norris
        case ricciardo
        case vettel
        case stroll
        case bottas
        case zhou
        case tsunoda
        case gasly
        case latifi
        case albon
        case schumacher
        case magnussen
    }
}

extension Driver.Name {

    var shortName: String {
        switch self {
            case .verstappen: return "VER"
            case .perez:      return "PER"
            case .russell:    return "RUS"
            case .hamilton:   return "HAM"
            case .leclerc:    return "LEC"
            case .sainz:      return "SAI"
            case .alonso:     return "ALO"
            case .ocon:       return "OCO"
            case .norris:     return "NOR"
            case .ricciardo:  return "RIC"
            case .vettel:     return "VET"
            case .stroll:     return "STR"
            case .bottas:     return "BOT"
            case .zhou:       return "ZHO"
            case .tsunoda:    return "TSU"
            case .gasly:      return "GAS"
            case .latifi:     return "LAT"
            case .albon:      return "ALB"
            case .schumacher: return "MSC"
            case .magnussen:  return "MAG"
        }
    }

    var longName: String {
        switch self {
            case .verstappen: return "🇳🇱 Verstappen"
            case .perez:      return "🇲🇽 Perez"
            case .russell:    return "🇬🇧 Russell"
            case .hamilton:   return "🇬🇧 Hamilton"
            case .leclerc:    return "🇲🇨 Leclerc"
            case .sainz:      return "🇪🇸 Sainz"
            case .alonso:     return "🇪🇸 Alonso"
            case .ocon:       return "🇫🇷 Ocon"
            case .norris:     return "🇬🇧 Norris"
            case .ricciardo:  return "🇦🇺 Ricciardo"
            case .vettel:     return "🇩🇪 Vettel"
            case .stroll:     return "🇨🇦 Stroll"
            case .bottas:     return "🇫🇮 Bottas"
            case .zhou:       return "🇨🇳 Zhou"
            case .tsunoda:    return "🇯🇵 Tsunoda"
            case .gasly:      return "🇫🇷 Gasly"
            case .latifi:     return "🇨🇦 Latifi"
            case .albon:      return "🇹🇭 Albon"
            case .schumacher: return "🇩🇪 Schumacher"
            case .magnussen:  return "🇩🇰 Magnussen"
        }
    }
}
