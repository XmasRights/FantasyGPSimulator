//
//  ListSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

extension ListSelectorView {
    static func race(_ race: Race) -> ListSelectorView {
        .init(
            title: "\(race.flag) \(race.shortName)",
            info: race.info,
            score: RaceScore(race: race))
    }

    static func  allSeason() -> ListSelectorView {
        .init(
            title: "F1 2021",
            info: Races.all.last!.info,
            score: SeasonScore())
    }
}

struct ListSelectorView: View {
    let title: String
    let info: RaceInfo
    let score: Score?

    var body: some View {
        List {
            Section {
                NavigationLink(
                    "Drivers",
                    destination: ScorableView(
                        title: title,
                        items: Driver.allCases,
                        score: score?.score,
                        price: info.cost))
            }

            Section {
                NavigationLink(
                    "Constructor",
                    destination: ScorableView(
                        title: title,
                        items: Constructor.allCases,
                        score: score?.score,
                        price: info.cost))
            }

            if let score = score {
                Section {
                    NavigationLink(
                        "Teams ",
                        destination: TeamListView(
                            teams: TeamFactory.shared.teams,
                            score: score.score,
                            price: info.cost))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(title)
    }
}

struct ListSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectorView.race(Races.all.first!)
    }
}
