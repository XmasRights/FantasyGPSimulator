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
            TrackSelectorView()
            .navigationTitle("Fantasy GP Simulator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
