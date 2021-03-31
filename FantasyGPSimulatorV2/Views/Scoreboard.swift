//
//  Scoreboard.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import SwiftUI

struct Scoreboard<T>: View where T: (Hashable & Displayable) {
    let info: [T: Int]

    private var cells: [Entry] {
        sorted(info)
    }

    var body: some View {
        List {
            ForEach(cells) { cell in
                HStack {
                    Text(cell.name)
                    Spacer()
                    Text("\(cell.score)")
                }
            }
        }
    }
}

private extension Scoreboard {
    func sorted<T>(_ dict: [T: Int]) -> [Entry] where T: (Hashable & Displayable) {
        let sorted = dict.sorted(by: { $0.value > $1.value })
        return sorted.map { args -> Entry in
            let (constructor, score) = args
            return .init(name: constructor.displayName, score: score)
        }
    }
}

private struct Entry: Hashable, Identifiable {
    let name: String
    let score: Int

    var id: String { name }
}


struct Scoreboard_Previews: PreviewProvider {
    private static let preview: [Driver: Int] = [
        .hamilton: 25,
        .bottas: 18,
        .verstappen: 12
    ]

    static var previews: some View {
        Scoreboard(info: preview)
    }
}
