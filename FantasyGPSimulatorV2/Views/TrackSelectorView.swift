//
//  TrackSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import SwiftUI

struct TrackSelectorView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(
                    "All Races",
                    destination: ListSelectorView.allSeason()
                )
            }

            Section {
                ForEach(0..<Races.all.count) { index in
                    NavigationLink(
                        "\(Races.all[index].flag) \(Races.all[index].grandPrixName)",
                        destination: ListSelectorView.race(Races.all[index]))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct TrackSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TrackSelectorView()
    }
}
