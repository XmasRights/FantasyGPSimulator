//
//  ScorableView.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 19/04/2021.
//

import SwiftUI

struct ScorableView<T: Displayable>: View {
    let items: [T]
    let score: (T) -> Int
    let price: (T) -> Double

    enum Selection: String, CaseIterable {
        case Score
        case Price
        case Value
    }
    @State private var selection = Selection.Score

    var body: some View {
        VStack {
            List {
                ForEach(entries) { entry in
                    ScorableCell(
                        name: entry.name,
                        value: entry.valueString(for: selection)
                    )
                }
            }

            Spacer()

            Picker("Hello", selection: $selection) {
                ForEach(Selection.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

private extension ScorableView {
    var entries: [Entry] {
        items
            .map { entry(for: $0) }
            .sorted(by: entrySort)
    }

    func entry(for item: T) -> Entry {
        Entry(
            name: item.displayName,
            score: score(item),
            price: price(item))
    }

    var entrySort: (Entry, Entry) -> Bool {
        return { lhs, rhs -> Bool in
            switch selection {
                case .Score: return lhs.score > rhs.score
                case .Price: return lhs.price > rhs.price
                case .Value: return lhs.value > rhs.value
            }
        }
    }
}

private extension Entry {
    func valueString<T: Displayable>(for selection: ScorableView<T>.Selection) -> String {
        switch selection {
            case .Score: return String(score)
            case .Price: return "$\(price)m"
            case .Value: return String(format: "%.2f", value)
        }
    }
}

struct ScorableView_Previews: PreviewProvider {
    static let items: [Driver] = [
        .hamilton,
        .verstappen,
        .ricciardo
    ]

    static var previews: some View {
        Group {
            ScorableView(
                items: items,
                score: { _ in return 42 },
                price: { _ in return 64.0 })
                .previewLayout(.sizeThatFits)
                .colorScheme(.light)

            ScorableView(
                items: items,
                score: { _ in return 42 },
                price: { _ in return 64.0 })
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)

        }
    }
}
