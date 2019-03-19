//
//  Position.swift
//  FantasySimulator
//
//  Created by Christopher Fonseka on 12/03/2019.
//  Copyright © 2019 Christopher Fonseka. All rights reserved.
//

import Foundation

enum Position {
    case DNF
    case P(Int)
}

extension Position {
    init?(_ value: Int) {
        guard value >= 0 else {
            return nil
        }
        
        switch value {
            case 0:
                self = .DNF
            
            case let x:
                self = .P(x)
        }
    }
}

extension Position: Comparable {
    
    static func < (lhs: Position, rhs: Position) -> Bool {
        switch (lhs, rhs) {
        case (.DNF, .DNF):
            return true
            
        case (.P, .DNF):
            return true
            
        case (.DNF, .P):
            return false
            
        case (.P(let x), .P(let y)):
            return x < y
        }
    }
}
