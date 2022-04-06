//
//  SortByToolbar.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 04/04/2022.
//

import SwiftUI

extension View {
    
    func sortByToolbar(_ sortBy: Binding<SortBy>) -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
    
                Picker("Sort By", selection: sortBy) {
                    ForEach(SortBy.allCases) { option in
                        Text(option.description).tag(option)
                    }
                }
                
            }
        }
    }
}

