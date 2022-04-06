//
//  Constructor.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

struct Constructor: Identifiable, Hashable, Scorable {
    var id: Name { name }
    
    let name: Name
    let price: Double
    let points: Int?
    
    var shortName: String { self.name.shortName }
    var longName: String { self.name.longName }
}

extension Constructor {
    
    enum Name: String {
        case redBull
        case mercedes
        case ferrari
        case alpine
        case mclaren
        case astonMartin
        case alfaRomeo
        case alphaTauri
        case williams
        case haas
    }
}

extension Constructor.Name {

    var shortName: String {
        switch self {
            case .redBull:     return "RBR"
            case .mercedes:    return "MER"
            case .ferrari:     return "FER"
            case .alpine:      return "ALP"
            case .mclaren:     return "MCL"
            case .astonMartin: return "ASM"
            case .alfaRomeo:   return "AR"
            case .alphaTauri:  return "AT"
            case .williams:    return "WIL"
            case .haas:        return "HAS"
        }
    }

    var longName: String {
        switch self {
            case .redBull:     return "Red Bull Racing"
            case .mercedes:    return "Mercedes"
            case .ferrari:     return "Ferrari"
            case .alpine:      return "Alpine"
            case .mclaren:     return "McLaren"
            case .astonMartin: return "Aston Martin"
            case .alfaRomeo:   return "Alfa Romeo"
            case .alphaTauri:  return "Alpha Tauri"
            case .williams:    return "Williams"
            case .haas:        return "Haas"
        }

    }
}
