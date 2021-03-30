//
//  RaceListView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import SwiftUI

struct RaceListView: View {
    var body: some View {
        List {
            ForEach(0..<Races.all.count) { index in
                NavigationLink(
                    Races.all[index].name,
                    destination: RaceView(info: info(for: Races.all[index]))
                )
            }
        }
    }

    private func info(for race: Race) -> RaceView.Info {
        let score = Score(race: race)

        let constructors = Constructor.allCases.reduce(into: [Constructor: Int]()) { (dict, const) in
            dict[const] = score.score(for: const)
        }

        let drivers = Driver.allCases.reduce(into: [Driver: Int]()) { (dict, driver) in
            dict[driver] = score.score(for: driver)
        }

        return .init(
            race: race.name,
            constructors: constructors,
            drivers: drivers
        )
    }
}

struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView()
    }
}
