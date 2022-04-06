//
//  ListCell.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

struct ListCell: View {
    
    enum Value {
        case price(Double)
        case points(Int)
        case value(Double)
    }
    
    let name: String
    let value: Value
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer()
            
            Text(value.asString)
                .foregroundColor(.secondary)
        }
    }
}

private extension ListCell.Value {
    
    var asString: String {
        switch self {
            case .price(let x):
                return "£\(String(format: "%.1f", x))m"
            case .points(let x):
                return String(x)
            case .value(let x):
                return "\(String(format: "%.2f", x))"
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
