//
//  TeamDataLoader.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 04/04/2022.
//

import Foundation

struct TeamRequest {
    let byPrice: [Team]
    let byPoints: [Team]
    let byValue: [Team]
}

actor TeamDataLoader {
    
    static let shared = TeamDataLoader()
    
    private enum CacheEntry {
        case inProgress(Task<TeamRequest, Never>)
        case ready(TeamRequest)
    }
    
    private var cache: [String: CacheEntry] = [:]
    
    func loadTeams(from race: Race) async -> TeamRequest {
        print("requesting \(race.id)")
        if let cached = cache[race.id] {
            switch cached {
                case .ready(let team):
                    print("is ready \(race.id)")
                    return team
                    
                case .inProgress(let task):
                    print("in progress \(race.id)")
                    return await task.value
            }
        }
        
        let task = Task {
            await _loadTeams(from: race)
        }
        
        let team = await task.value
        print("adding to cache \(race.id)")
        cache[race.id] = .ready(team)
        
        print("returning value \(race.id)")
        return team
    }
    
    private func _loadTeams(from race: Race) async -> TeamRequest {
        
        print("LOADING \(race.id)")
        let allTeams = race.teams.map { $0 }
        
        print("price \(race.id)")
        async let price  = allTeams.sorted(by: { $0.price > $1.price })
        print("points \(race.id)")
        async let points = allTeams.sorted(by: { ($0.points ?? 0) > ($1.points ?? 0) })
        print("value \(race.id)")
        async let value  = allTeams.sorted(by: { ($0.value ?? 0) > ($1.value ?? 0) })
        
        let output = TeamRequest(
            byPrice: await price,
            byPoints: await points,
            byValue: await value
        )
        
        print("LOAD COMPLETE \(race.id)")
        
        return output
    }
}
