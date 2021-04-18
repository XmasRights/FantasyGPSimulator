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
            Text("All Races")

            ForEach(raceNames, id: \.self) {
                Text($0)
            }
        }
    }
}

struct TrackSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TrackSelectorView()
    }
}
