//
//  RaceView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import SwiftUI

extension RaceView {
    struct Info {
        let race: String
        // TODO: Teams
        let constructors: [Constructor: Int]
        let drivers: [Driver: Int]
    }
}

struct RaceView: View {
    let info: Info

    private var constructors: [Entry] {
        sorted(info.constructors)
    }

    private var drivers: [Entry] {
        sorted(info.drivers)
    }

    var body: some View {
        List {
            Section(header: Text("Drivers")) {
                ForEach(drivers) { driver in
                    HStack {
                        Text(driver.name)
                        Spacer()
                        Text("\(driver.score)")
                    }
                }
            }

            Section(header: Text("Constructors")) {
                ForEach(constructors) { constructor in
                    HStack {
                        Text(constructor.name)
                        Spacer()
                        Text("\(constructor.score)")
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle(info.race)
    }
}

private extension RaceView {
    func sorted<T>(_ dict: [T: Int]) -> [Entry] where T: (Hashable & Displayable) {
        let sorted = dict.sorted(by: { $0.value > $1.value })
        return sorted.map { args -> Entry in
            let (constructor, score) = args
            return .init(name: constructor.displayName, score: score)
        }
    }
}

private struct Entry: Hashable, Identifiable {
    let name: String
    let score: Int

    var id: String { name }
}

struct RaceView_Previews: PreviewProvider {
    static var previews: some View {
        RaceView(info: .preview)
    }
}

extension RaceView.Info {
    static var preview: Self {
        .init(
            race: "Fonseka GP",
            constructors: [
                .mercedes: 42,
                .redBull: 32,
            ],
            drivers: [
                .hamilton: 25,
                .verstappen: 24,
                .pérez: 18,
                .bottas: 12
            ])
    }

    init(race: Race) {
        let score = RaceScore(race: race)

        let constructors = Constructor.allCases.reduce(into: [Constructor: Int]()) { (dict, const) in
            dict[const] = score.score(for: const)
        }

        let drivers = Driver.allCases.reduce(into: [Driver: Int]()) { (dict, driver) in
            dict[driver] = score.score(for: driver)
        }

        self.init(
            race: race.name,
            constructors: constructors,
            drivers: drivers
        )
    }
}
