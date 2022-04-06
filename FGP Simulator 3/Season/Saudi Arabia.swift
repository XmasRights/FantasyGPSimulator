//
//  Saudi Arabia.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 20/03/2022.
//

import Foundation

struct SaudiArabia: Race {
    
    let id = "SaudiArabia"
    
    var drivers: [Driver] {
        [
            .init(name: .verstappen, price: 25,   points: 5),
            .init(name: .perez,      price: 18.5, points: 0),
            .init(name: .russell,    price: 17.5, points: 27),
            .init(name: .hamilton,   price: 24.5, points: 26),
            .init(name: .leclerc,    price: 16.5, points: 41),
            .init(name: .sainz,      price: 17,   points: 21),
            .init(name: .alonso,     price: 10,   points: 7),
            .init(name: .ocon,       price: 9.5,  points: 18),
            .init(name: .norris,     price: 15,   points: 5),
            .init(name: .ricciardo,  price: 12.5, points: 12),
            .init(name: .vettel,     price: 8.5,  points: 5),
            .init(name: .stroll,     price: 7.5,  points: 21),
            .init(name: .bottas,     price: 7,    points: 13),
            .init(name: .zhou,       price: 3.5,  points: 16),
            .init(name: .tsunoda,    price: 4.5,  points: 28),
            .init(name: .gasly,      price: 8,    points: 5),
            .init(name: .latifi,     price: 4,    points: 12),
            .init(name: .albon,      price: 4,    points: 8),
            .init(name: .schumacher, price: 3.5,  points: 3),
            .init(name: .magnussen,  price: 2.0,  points: 21),
        ]
    }
    
    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 24,   points: 20),
            .init(name: .mercedes,    price: 25,   points: 11),
            .init(name: .ferrari,     price: 17.5, points: 14),
            .init(name: .alpine,      price: 11,   points: 16),
            .init(name: .mclaren,     price: 16,   points: 4),
            .init(name: .astonMartin, price: 8,    points: 1),
            .init(name: .alfaRomeo,   price: 5.5,  points: 14),
            .init(name: .alphaTauri,  price: 10,   points: 9),
            .init(name: .williams,    price: 5.5,  points: 2),
            .init(name: .haas,        price: 3,    points: 4),
        ]
    }
}
