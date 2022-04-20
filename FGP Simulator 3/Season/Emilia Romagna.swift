//
//  Emilia Romagna.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 10/04/2022.
//

import Foundation

struct EmiliaRomagna: Race {

    let id = "Emilia Romagna"

    var pointThreshold: Int { 100 }

    var drivers: [Driver] {
        [
            .init(name: .verstappen, price: 23.5, points: nil),
            .init(name: .perez,      price: 18.5, points: nil),
            .init(name: .russell,    price: 17.5, points: nil),
            .init(name: .hamilton,   price: 21.5, points: nil),
            .init(name: .leclerc,    price: 20.5, points: nil),
            .init(name: .sainz,      price: 17.0, points: nil),
            .init(name: .alonso,     price:  8.5, points: nil),
            .init(name: .ocon,       price: 11.0, points: nil),
            .init(name: .norris,     price: 14.0, points: nil),
            .init(name: .ricciardo,  price: 10.5, points: nil),
            .init(name: .vettel,     price:  6.0, points: nil),
            .init(name: .stroll,     price:  6.5, points: nil),
            .init(name: .bottas,     price:  8.5, points: nil),
            .init(name: .zhou,       price:  5.5, points: nil),
            .init(name: .tsunoda,    price:  5.0, points: nil),
            .init(name: .gasly,      price:  7.5, points: nil),
            .init(name: .latifi,     price:  3.0, points: nil),
            .init(name: .albon,      price:  6.0, points: nil),
            .init(name: .schumacher, price:  3.5, points: nil),
            .init(name: .magnussen,  price:  5.0, points: nil),
        ]
    }

    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 23.0, points: nil),
            .init(name: .mercedes,    price: 21.5, points: nil),
            .init(name: .ferrari,     price: 21.5, points: nil),
            .init(name: .alpine,      price: 10.5, points: nil),
            .init(name: .mclaren,     price: 13.5, points: nil),
            .init(name: .astonMartin, price:  5.0, points: nil),
            .init(name: .alfaRomeo,   price:  7.5, points: nil),
            .init(name: .alphaTauri,  price:  8.0, points: nil),
            .init(name: .williams,    price:  5.0, points: nil),
            .init(name: .haas,        price:  5.5, points: nil),
        ]
    }
}

