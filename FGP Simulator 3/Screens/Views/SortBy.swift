//
//  SortBy.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 20/03/2022.
//

import Foundation

enum SortBy: CaseIterable, Identifiable {
    case price
    case points
    case value
    
    var id: String { self.description }
}

extension SortBy {

    func sorter() -> (Scorable, Scorable) -> Bool {
        return { lhs, rhs in
            switch self {
                case .price:
                    return lhs.price > rhs.price
                    
                case .points:
                    return (lhs.points ?? 0) > (rhs.points ?? 0)
                    
                case .value:
                    return (lhs.value ?? 0) > (rhs.value ?? 0)
            }
        }
    }
}
 
extension SortBy: CustomStringConvertible {
    
    var description: String {
        switch self {
            case .price: return "Price"
            case .points: return "Points"
            case .value: return "Value"
        }
    }
}
