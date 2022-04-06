//
//  ScorableList.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 03/04/2022.
//

import SwiftUI

struct ScorableList<Content: Scorable & Identifiable>: View {
    
    let content: [Content]

    let sortBy: SortBy
    
    var body: some View {
        ForEach(sortedContent, id: \.id) { item in
            ListCell(name: item.description, value: value(for: item))
        }
        .animation(.default, value: sortBy)
    }
}

private extension ScorableList {

    private var sortedContent: [Content] {
        content.sorted(by: sortBy.sorter())
    }
    
    func value(for item: Content) -> ListCell.Value {
        switch sortBy {
            case .price:
                return .price(item.price)
            case .points:
                return .points(item.points ?? 0)
            case .value:
                return .value(item.value ?? 0)
        }
    }
}
