//
//  FGPData.swift
//  FGP Simulator 3
//
//  Created by Christopher Fonseka on 15/03/2022.
//

import SwiftUI

final class FGPData: ObservableObject {
    
    let raceCalendar: RaceCalendar = .init(races: [
        .init(flag: "🇧🇭", name: "Bahrain Grand Prix", data: Bahrain()),
        .init(flag: "🇸🇦", name: "Saudi Arabian Grand Prix", data: SaudiArabia()),
        .init(flag: "🇦🇺", name: "Australian Grand Prix", data: nil),
        .init(flag: "🇮🇹", name: "Emilia Romagna Grand Prix", data: nil),
        .init(flag: "🇺🇸", name: "Miami Grand Prix", data: nil),
        .init(flag: "🇪🇸", name: "Spanish Grand Prix", data: nil),
        .init(flag: "🇲🇨", name: "Monaco Grand Prix", data: nil),
        .init(flag: "🇦🇿", name: "Azerbaijan Grand Prix", data: nil),
        .init(flag: "🇨🇦", name: "Canadian Grand Prix", data: nil),
        .init(flag: "🇬🇧", name: "British Grand Prix", data: nil),
        .init(flag: "🇦🇹", name: "Austrian Grand Prix", data: nil),
        .init(flag: "🇫🇷", name: "French Grand Prix", data: nil),
        .init(flag: "🇭🇺", name: "Hungarian Grand Prix", data: nil),
        .init(flag: "🇧🇪", name: "Belgian Grand Prix", data: nil),
        .init(flag: "🇳🇱", name: "Dutch Grand Prix", data: nil),
        .init(flag: "🇮🇹", name: "Italian Grand Prix", data: nil),
        .init(flag: "🇸🇬", name: "Singapore Grand Prix", data: nil),
        .init(flag: "🇯🇵", name: "Japanese Grand Prix", data: nil),
        .init(flag: "🇺🇸", name: "United States Grand Prix", data: nil),
        .init(flag: "🇲🇽", name: "Mexico City Grand Prix", data: nil),
        .init(flag: "🇧🇷", name: "São Paulo Grand Prix", data: nil),
        .init(flag: "🇦🇪", name: "Abu Dhabi Grand Prix", data: nil),
    ])
}
