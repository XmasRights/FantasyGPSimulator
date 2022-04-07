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
            .init(name: .verstappen, price: 24.5, points: 34),
            .init(name: .perez,      price: 18.0, points: 27),
            .init(name: .russell,    price: 17.0, points: 18),
            .init(name: .hamilton,   price: 22.5, points: 16),
            .init(name: .leclerc,    price: 19.0, points: 24),
            .init(name: .sainz,      price: 18.0, points: 15),
            .init(name: .alonso,     price:  9.0, points: 0),
            .init(name: .ocon,       price: 10.5, points: 13),
            .init(name: .norris,     price: 13.5, points: 23),
            .init(name: .ricciardo,  price: 10.0, points: 0),
            .init(name: .vettel,     price:  7.0, points: 15),
            .init(name: .stroll,     price:  6.5, points: 5),
            .init(name: .bottas,     price:  8.0, points: 5),
            .init(name: .zhou,       price:  5.0, points: 3),
            .init(name: .tsunoda,    price:  5.5, points: 0),
            .init(name: .gasly,      price:  7.5, points: 12),
            .init(name: .latifi,     price:  3.5, points: 0),
            .init(name: .albon,      price:  4.5, points: 11),
            .init(name: .schumacher, price:  3.0, points: 0),
            .init(name: .magnussen,  price:  5.0, points: 10),
        ]
    }
    
    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 23.5, points: 40),
            .init(name: .mercedes,    price: 22.5, points: 17),
            .init(name: .ferrari,     price: 20.5, points: 34),
            .init(name: .alpine,      price: 10.5, points: 8),
            .init(name: .mclaren,     price: 13.0, points: 10),
            .init(name: .astonMartin, price:  5.5, points: 5),
            .init(name: .alfaRomeo,   price:  7.5, points: 1),
            .init(name: .alphaTauri,  price:  9.0, points: 5),
            .init(name: .williams,    price:  4.5, points: 2),
            .init(name: .haas,        price:  6.0, points: 3),
        ]
    }
}
