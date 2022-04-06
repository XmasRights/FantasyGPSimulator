//
//  RaceListView.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

struct RaceListView: View {
    
    let calendar: RaceCalendar
    
    var body: some View {
        List {

            Section {
                NavigationLink(
                    "All Races",
                    destination: RaceView(race: AllRaces())
                )
            }

            ForEach(calendar.races) { race in
                if let data = race.data {
                    NavigationLink(
                        "\(race.flag) \(race.name)",
                        destination: RaceView(race: data)
                            .navigationTitle(race.name)
                    )
                    
                } else {
                    Text("\(race.flag) \(race.name)")
                }
                
            }
        }
    }
}

struct RaceListView_Previews: PreviewProvider {
    static let preview: RaceCalendar = .init(
        races: [
            .init(flag: "🇧🇭", name: "Bahrain", data: nil),
            .init(flag: "🇦🇺", name: "Australia", data: nil),
            .init(flag: "🇬🇧", name: "Great Britain", data: nil),
            .init(flag: "🇸🇬", name: "Singapore", data: nil),
            .init(flag: "🇱🇰", name: "Sri Lanka", data: nil),
        ]
    )
    
    static var previews: some View {
        RaceListView(calendar: preview)
    }
}
