//
//  TeamView.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

struct TeamView: View {
    let teams: [Team]

    @State private var sortBy = SortBy.points

    var content: [Team] {
        teams.sorted(by: sortBy.sorter())
    }

    var body: some View {
        List {
            ForEach(content, id: \.id) { team in
                HStack {
                    Text(team.shortName)
                    Spacer()

                    if let price = team.price {
                        Text("£\(String(format: "%.1f", price))m")
                            .foregroundColor(.secondary)
                    }

                    if let points = team.points {
                        Text("\(points)")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .sortByToolbar($sortBy)
    }
}

//struct TeamView_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamView(race: Bahrain())
//    }
//}
