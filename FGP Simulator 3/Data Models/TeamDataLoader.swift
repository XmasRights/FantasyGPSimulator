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
        if let cached = cache[race.id] {
            switch cached {
                case .ready(let team):
                    return team
                    
                case .inProgress(let task):
                    return await task.value
            }
        }
        
        let task = Task {
            await _loadTeams(from: race)
        }
        
        let team = await task.value
        cache[race.id] = .ready(team)
        return team
    }
    
    private func _loadTeams(from race: Race) async -> TeamRequest {
        
        let allTeams = race.teams.map { $0 }
        
        async let price  = allTeams.sorted(by: { $0.price > $1.price })
        async let points = allTeams.sorted(by: { ($0.points ?? 0) > ($1.points ?? 0) })
        async let value  = allTeams.sorted(by: { ($0.value ?? 0) > ($1.value ?? 0) })
        
        return .init(
            byPrice: await price,
            byPoints: await points,
            byValue: await value
        )
    }
}
