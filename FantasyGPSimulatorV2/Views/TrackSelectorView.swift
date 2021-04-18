//
//  TrackSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import SwiftUI

struct TrackSelectorView: View {
    var raceNames: [String] {
        Races.all.map { $0.name }
    }

    var body: some View {
        List {
            Section {
                Text("All Races")
            }

            Section {
                ForEach(0..<Races.all.count) { index in
                    NavigationLink(
                        Races.all[index].name,
                        destination: RaceView(info: .init(race: Races.all[index])))
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
