//
//  Constructor.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import Foundation

enum Constructor: CaseIterable {
    case mercedes
    case redBull
    case mcLaren
    case astonMartin
    case ferrari
    case alphaTauri
    case alfaRomeo
    case alpine
    case haas
    case williams
}

extension Constructor: Displayable {
    var displayName: String {
        switch self {
            case .mercedes:    return "Mercedes"
            case .redBull:     return "Red Bull"
            case .mcLaren:     return "McLaren"
            case .astonMartin: return "Aston Martin"
            case .ferrari:     return "Ferrari"
            case .alphaTauri:  return "Alpha Tauri"
            case .alfaRomeo:   return "Alfa Romeo"
            case .alpine:      return "Alpine"
            case .haas:        return "Haas"
            case .williams:    return "Williams"
        }
    }
}
