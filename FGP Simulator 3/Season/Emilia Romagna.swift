//
//  Emilia Romagna.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 10/04/2022.
//

import Foundation

struct EmiliaRomagna: Race {

    let id = "Emilia Romagna"

    var pointThreshold: Int { 160 }

    var drivers: [Driver] {
        [
            .init(name: .verstappen, price: 23.5, points: 41),
            .init(name: .perez,      price: 18.5, points: 21),
            .init(name: .russell,    price: 17.5, points: 38),
            .init(name: .hamilton,   price: 21.5, points: 3),
            .init(name: .leclerc,    price: 20.5, points: 13),
            .init(name: .sainz,      price: 17.0, points: 0),
            .init(name: .alonso,     price:  8.5, points: 5),
            .init(name: .ocon,       price: 11.0, points: 6),
            .init(name: .norris,     price: 14.0, points: 26),
            .init(name: .ricciardo,  price: 10.5, points: 0),
            .init(name: .vettel,     price:  6.0, points: 24),
            .init(name: .stroll,     price:  6.5, points: 16),
            .init(name: .bottas,     price:  8.5, points: 21),
            .init(name: .zhou,       price:  5.5, points: 15),
            .init(name: .tsunoda,    price:  5.0, points: 26),
            .init(name: .gasly,      price:  7.5, points: 15),
            .init(name: .latifi,     price:  3.0, points: 9),
            .init(name: .albon,      price:  6.0, points: 26),
            .init(name: .schumacher, price:  3.5, points: 0),
            .init(name: .magnussen,  price:  5.0, points: 7),
        ]
    }

    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 23.0, points: 45),
            .init(name: .mercedes,    price: 21.5, points: 20),
            .init(name: .ferrari,     price: 21.5, points: 8),
            .init(name: .alpine,      price: 10.5, points: 2),
            .init(name: .mclaren,     price: 13.5, points: 17),
            .init(name: .astonMartin, price:  5.0, points: 15),
            .init(name: .alfaRomeo,   price:  7.5, points: 17),
            .init(name: .alphaTauri,  price:  8.0, points: 16),
            .init(name: .williams,    price:  5.0, points: 10),
            .init(name: .haas,        price:  5.5, points: 2),
        ]
    }
}

