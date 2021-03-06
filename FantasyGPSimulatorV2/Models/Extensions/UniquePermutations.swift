//
//  UniquePermutations.swift
//  FantasyGPSimulatorV2
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import Foundation

extension Array {
    func uniquePermutations() -> [[Element]] {
        var output = [[Element]]()
        uniquePermutations([], listB: self, output: &output, filter: nil)
        return output
    }

    func uniquePermutations(filter: @escaping ([Element]) -> Bool)  -> [[Element]] {
        var output = [[Element]]()
        uniquePermutations([], listB: self, output: &output, filter: filter)
        return output
    }
}

private extension Array {
    private func uniquePermutations(_ listA: [Element],
                                    listB: [Element],
                                    output: inout [[Element]],
                                    filter: (([Element]) -> Bool)?) {

        if let filter = filter {
            if (filter(listA)) { output.append(listA) }
        } else {
            output.append(listA)
        }

        if (!listB.isEmpty) {
            for (index, element) in listB.enumerated() {
                var newA = listA; newA.append(element)
                var newB = listB; newB.removeSubrange(0...index)

                uniquePermutations(newA, listB: newB, output: &output, filter: filter)
            }
        }
    }
}
