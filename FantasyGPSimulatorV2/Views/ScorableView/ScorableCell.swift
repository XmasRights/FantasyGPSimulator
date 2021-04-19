//
//  ScorableCell.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

struct ScorableCell: View {
    let name: String
    let value: String

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(value)
        }
    }
}

struct ScorableCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScorableCell(
                name: "Christopher Fonseka",
                value: "64")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)

            ScorableCell(
                name: "Christopher Fonseka",
                value: "64")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
