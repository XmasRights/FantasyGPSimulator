//
//  ContentView.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 13/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    let data = FGPData()
    
    var body: some View {
        NavigationView {
            RaceListView(
                calendar: data.raceCalendar
            )
            .navigationTitle("F1 2022")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
