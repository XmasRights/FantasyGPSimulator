//
//  ListSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

extension ListSelectorView {
    static func race(_ race: Race) -> ListSelectorView? {
        guard let score = RaceScore(race: race) else { return nil }
        return .init(race: race, score: score)
    }

    static func  allSeason() -> ListSelectorView {
        .init(race: Races.all.last!, score: SeasonScore())
    }
}

struct ListSelectorView: View {
    let race: Race
    let score: Score

    var body: some View {
        List {
            Section {
                NavigationLink(
                    "Drivers",
                    destination: ScorableView(
                        items: Driver.allCases,
                        score: score.score,
                        price: race.info.cost))
            }

            Section {
                NavigationLink(
                    "Constructor",
                    destination: ScorableView(
                        items: Constructor.allCases,
                        score: score.score,
                        price: race.info.cost))
            }

            Section {
                NavigationLink(
                    "Teams ",
                    destination: TeamListView(
                        teams: TeamFactory.shared.teams,
                        score: score.score,
                        price: race.info.cost))
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(race.name)
    }
}

struct ListSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectorView.race(Races.all.first!)
    }
}
