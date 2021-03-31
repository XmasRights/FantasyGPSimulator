//
//  ContentView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    "Races",
                    destination: RaceListView()
                )

                NavigationLink(
                    "Drivers",
                    destination: driverList()
                )

                NavigationLink(
                    "Teams",
                    destination: Text("TODO")
                )
            }
            .navigationTitle("Fantasy GP Simulator")
        }
    }

    private func driverList() -> some View {
        let scores = Score(race: Bahrain())
        let info = Driver.allCases.reduce(into: [Driver: Int]()) { (dict, driver) in
            dict[driver] = scores.score(for: driver)
        }

        return Scoreboard(info: info)
            .navigationTitle("Drivers")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
