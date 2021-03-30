//
//  DriverView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 30/03/2021.
//

import SwiftUI

struct DriverView: View {
    // TODO: Data model with drivers and scores, ordered

    var body: some View {
        List {
            ForEach(Driver.allCases, id: \.self) { driver in
                HStack {
                    Text("\(driver.displayName)")
                    Spacer()
                    Text("0") // TODO: Score
                }
            }
        }
        .navigationTitle("Drivers")
    }
}

struct DriverView_Previews: PreviewProvider {
    static var previews: some View {
        DriverView()
    }
}
