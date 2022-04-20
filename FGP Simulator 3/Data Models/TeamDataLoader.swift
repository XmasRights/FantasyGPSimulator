//
//  TeamDataLoader.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 04/04/2022.
//

import Foundation

actor TeamDataLoader {
    
    static let shared = TeamDataLoader()

    static let budgetCap = 85.0

    private enum CacheEntry {
        case inProgress(Task<[Team], Never>)
        case ready([Team])
    }
    
    private var cache: [String: CacheEntry] = [:]
    
    func loadTeams(from race: Race) async -> [Team] {
        if let cached = cache[race.id] {
            switch cached {
                case .ready(let team):
                    print("ready from cache")
                    return team
                    
                case .inProgress(let task):
                    print("was loaded")
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
    
    private func _loadTeams(from race: Race) async -> [Team] {
        let out = race.teams
            .map { $0 }
            .lazy
            .filter { race.pointThreshold < ($0.points ?? 0) }
            .filter { $0.price <= Self.budgetCap }
        return Array(out)
    }
}
