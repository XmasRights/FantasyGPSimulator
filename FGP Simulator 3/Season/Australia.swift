//
//  Australia.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 07/04/2022.
//

import Foundation

struct Australia: Race {

    let id = "Australia"

    var pointThreshold: Int { 150 }

    var drivers: [Driver] {
        [
            .init(name: .verstappen, price: 24.5, points: 5),
            .init(name: .perez,      price: 18.0, points: 21),
            .init(name: .russell,    price: 17.0, points: 24),
            .init(name: .hamilton,   price: 22.5, points: 20),
            .init(name: .leclerc,    price: 19.0, points: 41),
            .init(name: .sainz,      price: 18.0, points: 0),
            .init(name: .alonso,     price:  9.0, points: 0),
            .init(name: .ocon,       price: 10.5, points: 14),
            .init(name: .norris,     price: 13.5, points: 15),
            .init(name: .ricciardo,  price: 10.0, points: 11),
            .init(name: .vettel,     price:  7.0, points: 5),
            .init(name: .stroll,     price:  6.5, points: 21),
            .init(name: .bottas,     price:  8.0, points: 21),
            .init(name: .zhou,       price:  5.0, points: 9),
            .init(name: .tsunoda,    price:  5.5, points: 0),
            .init(name: .gasly,      price:  7.5, points: 13),
            .init(name: .latifi,     price:  3.5, points: 11),
            .init(name: .albon,      price:  4.5, points: 31),
            .init(name: .schumacher, price:  3.0, points: 11),
            .init(name: .magnussen,  price:  5.0, points: 6),
        ]
    }

    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 23.5, points: 19),
            .init(name: .mercedes,    price: 22.5, points: 31),
            .init(name: .ferrari,     price: 20.5, points: 26),
            .init(name: .alpine,      price: 10.5, points: 7),
            .init(name: .mclaren,     price: 13.0, points: 19),
            .init(name: .astonMartin, price:  5.5, points: 7),
            .init(name: .alfaRomeo,   price:  7.5, points: 11),
            .init(name: .alphaTauri,  price:  9.0, points: 4),
            .init(name: .williams,    price:  4.5, points: 13),
            .init(name: .haas,        price:  6.0, points: 4),
        ]
    }
}
