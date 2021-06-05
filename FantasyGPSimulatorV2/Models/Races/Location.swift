//
//  Location.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import Foundation

enum Location {
    case Bahrain
    case EmiliaRomagna
    case Portugal
    case Spain
    case Monaco
    case Azerbaijan
}

extension Location {
    var grandPrixName: String {
        switch self {
            case .Bahrain:       return "Bahrain Grand Prix"
            case .EmiliaRomagna: return "Emilia Romagna Grand Prix"
            case .Portugal:      return "Portugese Grand Prix"
            case .Spain:         return "Spanish Grand Prix"
            case .Monaco:        return "Monaco Grand Prix"
            case .Azerbaijan:    return "Azerbaijan Grand Prix"

        }
    }

    var shortName: String {
        switch self {
            case .Bahrain:       return "Bahrain"
            case .EmiliaRomagna: return "Emilia Romagna"
            case .Portugal:      return "Portugal"
            case .Spain:         return "Spain"
            case .Monaco:        return "Monaco"
            case .Azerbaijan:    return "Azerbaijan"

        }
    }

    var flag: String {
        switch self {
            case .Bahrain:       return "🇧🇭"
            case .EmiliaRomagna: return "🇮🇹"
            case .Portugal:      return "🇵🇹"
            case .Spain:         return "🇪🇸"
            case .Monaco:        return "🇲🇨"
            case .Azerbaijan:    return "🇦🇿"
        }
    }
}
