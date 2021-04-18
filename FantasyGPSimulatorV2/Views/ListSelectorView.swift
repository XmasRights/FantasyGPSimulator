//
//  ListSelectorView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

struct ListSelectorView: View {
    let race: Race

    var body: some View {
        List {
            Section {
                Text("Drivers")
            }

            Section {
                Text("Constructor")
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
