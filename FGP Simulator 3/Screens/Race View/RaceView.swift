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
    @State var bestTeamRequest: TeamRequest?
    
    var body: some View {
        List {
            bestTeamButton
            
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
            self.bestTeamRequest = await TeamDataLoader.shared.loadTeams(from: race)
        }
    }
    
    var bestTeamButton: some View {
        VStack {
            if let teams = bestTeamRequest {
                NavigationLink(
                    "Best Teams",
                    destination: TeamView(teams: teams)
                )
            } else {
                HStack {
                    Text("Loading...")
                    Spacer()
                    ProgressView()
                }
            }
            
        }
    }
}

//struct RaceView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        RaceView(race: Bahrain())
//    }
//}
