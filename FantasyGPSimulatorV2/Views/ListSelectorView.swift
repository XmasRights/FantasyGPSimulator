//
//  ListSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

struct ListSelectorView: View {
    let race: Race
    let score: Score

    init(race: Race) {
        self.race = race
        self.score = RaceScore(race: race)
    }

    var body: some View {
        List {
            Section {
                NavigationLink(
                    "Drivers",
                    destination: ScorableView(
                        items: Driver.allCases,
                        score: score.score,
                        price: race.cost))
            }

            Section {
                NavigationLink(
                    "Constructor",
                    destination: ScorableView(
                        items: Constructor.allCases,
                        score: score.score,
                        price: race.cost))
            }

            Section {
                Text("Team")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(race.name)
    }
}

struct ListSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectorView(race: Races.all.first!)
    }
}
