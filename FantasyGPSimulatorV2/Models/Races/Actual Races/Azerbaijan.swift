//
//  Azerbaijan.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 06/06/2021.
//

import Foundation

struct Azerbaijan: Race {
    let location = Location.Azerbaijan
    let info: RaceInfo = AzerbaijanInfo()
    let result: RaceResult? = nil // AzerbaijanResult()
}

//private struct AzerbaijanResult: RaceResult {
//    func qualifyingResult(for driver: Driver) -> Position {
//        switch driver {
//            case .leclerc: return .p(1)
//            case .hamilton: return .p(2)
//            case .verstappen: return .p(3)
//            case .gasly: return .p(4)
//            case .sainz: return .p(5)
//            case .norris: return .p(6)
//            case .pérez: return .p(7)
//            case .tsunoda: return .p(8)
//            case .alonso: return .p(9)
//            case .bottas: return .p(10)
//            case .vettel: return .p(11)
//            case .ocon: return .p(12)
//            case .ricciardo: return .p(13)
//            case .räikkönen: return .p(14)
//            case .russell: return .p(15)
//            case .latifi: return .p(16)
//            case .schumacher: return .p(17)
//            case .mazepin: return .p(18)
//            case .stroll: return .p(19)
//            case .giovinazzi: return .p(20)
//        }
//    }
//
//    func startingGrid(for driver: Driver) -> Position {
//        switch driver {
//            case .leclerc: return .p(1)
//            case .hamilton: return .p(2)
//            case .verstappen: return .p(3)
//            case .gasly: return .p(4)
//            case .sainz: return .p(5)
//            case .norris: return .p(6)
//            case .pérez: return .p(7)
//            case .tsunoda: return .p(8)
//            case .alonso: return .p(9)
//            case .bottas: return .p(10)
//            case .vettel: return .p(11)
//            case .ocon: return .p(12)
//            case .ricciardo: return .p(13)
//            case .räikkönen: return .p(14)
//            case .russell: return .p(15)
//            case .latifi: return .p(16)
//            case .schumacher: return .p(17)
//            case .mazepin: return .p(18)
//            case .stroll: return .p(19)
//            case .giovinazzi: return .p(20)
//        }
//    }
//
//    func raceResult(for driver: Driver) -> Position {
//        switch driver {
//            case <#Driver#>: return .p(1)
//            case <#Driver#>: return .p(2)
//            case <#Driver#>: return .p(3)
//            case <#Driver#>: return .p(4)
//            case <#Driver#>: return .p(5)
//            case <#Driver#>: return .p(6)
//            case <#Driver#>: return .p(7)
//            case <#Driver#>: return .p(8)
//            case <#Driver#>: return .p(9)
//            case <#Driver#>: return .p(10)
//            case <#Driver#>: return .p(11)
//            case <#Driver#>: return .p(12)
//            case <#Driver#>: return .p(13)
//            case <#Driver#>: return .p(14)
//            case <#Driver#>: return .p(15)
//            case <#Driver#>: return .p(16)
//            case <#Driver#>: return .p(17)
//            case <#Driver#>: return .p(18)
//            case <#Driver#>: return .p(19)
//            case <#Driver#>: return .p(20)
//        }
//    }
//
//    var fastestLap: Driver { <#Driver#> }
//}

private struct AzerbaijanInfo: RaceInfo {
    func cost(of driver: Driver) -> Double {
        switch driver {
            case .verstappen: return 23
            case .pérez:      return 18.5
            case .bottas:     return 18
            case .hamilton:   return 25
            case .leclerc:    return 15.5
            case .sainz:      return 15
            case .alonso:     return 11
            case .ocon:       return 10.5
            case .norris:     return 13
            case .ricciardo:  return 10
            case .vettel:     return 11.5
            case .stroll:     return 10
            case .räikkönen:  return 5.5
            case .giovinazzi: return 6
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
            case .alphaTauri:  return 8
            case .williams:    return 4.5
            case .haas:        return 4
        }
    }
}
