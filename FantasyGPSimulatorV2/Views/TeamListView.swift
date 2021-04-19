//
//  TeamListView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

struct TeamListView: View {
    let budget = 77.5

    let teams: [Team]
    let score: (Team) -> Int
    let price: (Team) -> Double

    var body: some View {
        List {
            ForEach(entries) { entry in
                HStack {
                    Text(entry.name)
                    Spacer()
                    Text(entry.priceString)
                    Text(entry.scoreString)
                }
            }
        }
    }
}

private extension TeamListView {
    var entries: [Entry] {
        let start = DispatchTime.now()

        let filtered = teams
            .filter { price($0) <= budget && score($0) > 140 }

        let makeEntires = filtered.map {
            Entry(
                name: $0.shortName,
                score: score($0),
                price: price($0))
        }

        let sorted = makeEntires.sorted().suffix(20)

        let end = DispatchTime.now()

        print("Team Generation took \(timeBetween(start, end))")

        return sorted.reversed()
    }

    func timeBetween(_ start: DispatchTime, _ end: DispatchTime) -> String {
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000
        return "\(timeInterval) seconds"
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var team: [Team] {
        [
            .init(
                drivers: [.verstappen, .hamilton],
                constructors: [.redBull])
        ]
    }

    static var previews: some View {
        TeamListView(
            teams: team,
            score: { _ in return 42 },
            price: { _ in return 64 })
    }
}
