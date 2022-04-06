//
//  RaceView.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

struct RaceView: View {
    let race: Race

    @State private var sortBy = SortBy.points
    
    var body: some View {
        List {
            
            NavigationLink(
                "Best Teams",
                destination: Text("Hello world") // TeamView(race: race)
            )
            
            Section(header: Text("Drivers")) {
                ScorableList(
                    content: race.drivers,
                    sortBy: sortBy
                )
            }
            
            Section(header: Text("Constructors")) {
                ScorableList(
                    content: race.constructors,
                    sortBy: sortBy
                )
            }
        }
        .animation(.default, value: sortBy)
        .sortByToolbar($sortBy)
        .task {
            print("Start")
            let request = await TeamDataLoader.shared.loadTeams(from: race)
            print("Done... \(request.byPoints.count)")
        }
    }
}

//struct RaceView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        RaceView(race: Bahrain())
//    }
//}
