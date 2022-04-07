//
//  Australia.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 07/04/2022.
//

import Foundation

struct Australia: Race {

    let id = "Australia"

    var pointThreshold: Int { 100 }

    var drivers: [Driver] {
        [
            .init(name: .verstappen, price: 24.5, points: nil),
            .init(name: .perez,      price: 18.0, points: nil),
            .init(name: .russell,    price: 17.0, points: nil),
            .init(name: .hamilton,   price: 22.5, points: nil),
            .init(name: .leclerc,    price: 19.0, points: nil),
            .init(name: .sainz,      price: 18.0, points: nil),
            .init(name: .alonso,     price:  9.0, points: nil),
            .init(name: .ocon,       price: 10.5, points: nil),
            .init(name: .norris,     price: 13.5, points: nil),
            .init(name: .ricciardo,  price: 10.0, points: nil),
            .init(name: .vettel,     price:  7.0, points: nil),
            .init(name: .stroll,     price:  6.5, points: nil),
            .init(name: .bottas,     price:  8.0, points: nil),
            .init(name: .zhou,       price:  5.0, points: nil),
            .init(name: .tsunoda,    price:  5.5, points: nil),
            .init(name: .gasly,      price:  7.5, points: nil),
            .init(name: .latifi,     price:  3.5, points: nil),
            .init(name: .albon,      price:  4.5, points: nil),
            .init(name: .schumacher, price:  3.0, points: nil),
            .init(name: .magnussen,  price:  5.0, points: nil),
        ]
    }

    var constructors: [Constructor] {
        [
            .init(name: .redBull,     price: 23.5, points: nil),
            .init(name: .mercedes,    price: 22.5, points: nil),
            .init(name: .ferrari,     price: 20.5, points: nil),
            .init(name: .alpine,      price: 10.5, points: nil),
            .init(name: .mclaren,     price: 13.0, points: nil),
            .init(name: .astonMartin, price:  5.5, points: nil),
            .init(name: .alfaRomeo,   price:  7.5, points: nil),
            .init(name: .alphaTauri,  price:  9.0, points: nil),
            .init(name: .williams,    price:  4.5, points: nil),
            .init(name: .haas,        price:  6.0, points: nil),
        ]
    }
}
