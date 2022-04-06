//
//  TeamView.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

struct TeamView: View {
    let teams: TeamRequest

    @State private var sortBy = SortBy.points

    private var content: [Team] {
        switch sortBy {
            case .price:
                return teams.byPrice

            case .points:
                return teams.byPoints

            case .value:
                return teams.byValue
        }
    }

    var body: some View {
        List {
            ForEach(content) { team in
                HStack {
                    Text(team.description)
                    Spacer()
                    Text("\(team.points ?? 0)")
                }
            }
        }
    }
}

//struct TeamView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamView(race: Bahrain())
//    }
//}
