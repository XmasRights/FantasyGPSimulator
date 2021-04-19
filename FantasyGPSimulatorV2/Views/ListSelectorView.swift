//
//  ListSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

extension ListSelectorView {
    static func race(_ race: Race) -> ListSelectorView {
        .init(race: race, score: RaceScore(race: race))
    }

    static func  allSeason() -> ListSelectorView {
        .init(race: Races.all.last!, score: SeasonScore())
    }
}

struct ListSelectorView: View {
    let race: Race
    let score: Score

    let teamFactory = TeamFactory(
        drivers: Driver.allCases,
        constructors: Constructor.allCases)

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
                NavigationLink(
                    "Teams ",
                    destination: TeamListView(
                        teams: teamFactory.teams,
                        score: score.score,
                        price: race.cost))
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
