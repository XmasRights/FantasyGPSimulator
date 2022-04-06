//
//  Race.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import Foundation

protocol Race {
    var id: String { get }
    
    var drivers: [Driver] { get }
    var constructors: [Constructor] { get }
}
