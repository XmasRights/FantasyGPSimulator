//
//  PortugalTests.swift
//  FantasyGPSimulatorV2Tests
//
//  Created by Christopher Fonseka on 05/06/2021.
//

import XCTest
@testable import FantasyGPSimulatorV2

class PortugalTests: XCTestCase {
    private let s = RaceScore(race: Portugal())!

    func testDriverScores() {
        XCTAssertEqual(s.score(for: .verstappen), 26)
        XCTAssertEqual(s.score(for: .pérez),      12)
        XCTAssertEqual(s.score(for: .bottas),     31)
        XCTAssertEqual(s.score(for: .hamilton),   28)
        XCTAssertEqual(s.score(for: .leclerc),    14)
        XCTAssertEqual(s.score(for: .sainz),       5)
        XCTAssertEqual(s.score(for: .alonso),     19)
        XCTAssertEqual(s.score(for: .ocon),       11)
        XCTAssertEqual(s.score(for: .norris),     21)
        XCTAssertEqual(s.score(for: .ricciardo),  23)
        XCTAssertEqual(s.score(for: .vettel),      5)
        XCTAssertEqual(s.score(for: .stroll),      9)
        XCTAssertEqual(s.score(for: .räikkönen),   0)
        XCTAssertEqual(s.score(for: .giovinazzi),  5)
        XCTAssertEqual(s.score(for: .tsunoda),     0)
        XCTAssertEqual(s.score(for: .gasly),       6)
        XCTAssertEqual(s.score(for: .latifi),      0)
        XCTAssertEqual(s.score(for: .russell),     5)
        XCTAssertEqual(s.score(for: .schumacher), 11)
        XCTAssertEqual(s.score(for: .mazepin),     3)
    }

    func testDriverScores_race() {
        XCTAssertEqual(s._raceScore(for: .verstappen), 18)
        XCTAssertEqual(s._raceScore(for: .pérez),      12)
        XCTAssertEqual(s._raceScore(for: .bottas),     16)
        XCTAssertEqual(s._raceScore(for: .hamilton),   25)
        XCTAssertEqual(s._raceScore(for: .leclerc),     8)
        XCTAssertEqual(s._raceScore(for: .sainz),       0)
        XCTAssertEqual(s._raceScore(for: .alonso),      4)
        XCTAssertEqual(s._raceScore(for: .ocon),        6)
        XCTAssertEqual(s._raceScore(for: .norris),     10)
        XCTAssertEqual(s._raceScore(for: .ricciardo),   2)
        XCTAssertEqual(s._raceScore(for: .vettel),      0)
        XCTAssertEqual(s._raceScore(for: .stroll),      0)
        XCTAssertEqual(s._raceScore(for: .räikkönen),   0)
        XCTAssertEqual(s._raceScore(for: .giovinazzi),  0)
        XCTAssertEqual(s._raceScore(for: .tsunoda),     0)
        XCTAssertEqual(s._raceScore(for: .gasly),       1)
        XCTAssertEqual(s._raceScore(for: .latifi),      0)
        XCTAssertEqual(s._raceScore(for: .russell),     0)
        XCTAssertEqual(s._raceScore(for: .schumacher),  0)
        XCTAssertEqual(s._raceScore(for: .mazepin),     0)
    }

    func testDriverScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .verstappen),  3)
        XCTAssertEqual(s._bonusScore(for: .pérez),       0)
        XCTAssertEqual(s._bonusScore(for: .bottas),      0)
        XCTAssertEqual(s._bonusScore(for: .hamilton),    3)
        XCTAssertEqual(s._bonusScore(for: .leclerc),     6)
        XCTAssertEqual(s._bonusScore(for: .sainz),       0)
        XCTAssertEqual(s._bonusScore(for: .alonso),     15)
        XCTAssertEqual(s._bonusScore(for: .ocon),        0)
        XCTAssertEqual(s._bonusScore(for: .norris),      6)
        XCTAssertEqual(s._bonusScore(for: .ricciardo),  21)
        XCTAssertEqual(s._bonusScore(for: .vettel),      0)
        XCTAssertEqual(s._bonusScore(for: .stroll),      9)
        XCTAssertEqual(s._bonusScore(for: .räikkönen),   0)
        XCTAssertEqual(s._bonusScore(for: .giovinazzi),  0)
        XCTAssertEqual(s._bonusScore(for: .tsunoda),     0)
        XCTAssertEqual(s._bonusScore(for: .gasly),       0)
        XCTAssertEqual(s._bonusScore(for: .latifi),      0)
        XCTAssertEqual(s._bonusScore(for: .russell),     0)
        XCTAssertEqual(s._bonusScore(for: .schumacher),  6)
        XCTAssertEqual(s._bonusScore(for: .mazepin),     3)
    }

    func testDriverScores_quali() {
        XCTAssertEqual(s._qualiScore(for: .verstappen),  5)
        XCTAssertEqual(s._qualiScore(for: .pérez),       0)
        XCTAssertEqual(s._qualiScore(for: .bottas),     15)
        XCTAssertEqual(s._qualiScore(for: .hamilton),    0)
        XCTAssertEqual(s._qualiScore(for: .leclerc),     0)
        XCTAssertEqual(s._qualiScore(for: .sainz),       5)
        XCTAssertEqual(s._qualiScore(for: .alonso),      0)
        XCTAssertEqual(s._qualiScore(for: .ocon),        5)
        XCTAssertEqual(s._qualiScore(for: .norris),      5)
        XCTAssertEqual(s._qualiScore(for: .ricciardo),   0)
        XCTAssertEqual(s._qualiScore(for: .vettel),      5)
        XCTAssertEqual(s._qualiScore(for: .stroll),      0)
        XCTAssertEqual(s._qualiScore(for: .räikkönen),   0)
        XCTAssertEqual(s._qualiScore(for: .giovinazzi),  5)
        XCTAssertEqual(s._qualiScore(for: .tsunoda),     0)
        XCTAssertEqual(s._qualiScore(for: .gasly),       5)
        XCTAssertEqual(s._qualiScore(for: .latifi),      0)
        XCTAssertEqual(s._qualiScore(for: .russell),     5)
        XCTAssertEqual(s._qualiScore(for: .schumacher),  5)
        XCTAssertEqual(s._qualiScore(for: .mazepin),     0)
    }


    func testConstructorScores() {
        XCTAssertEqual(s.score(for: .redBull),     31)
        XCTAssertEqual(s.score(for: .mercedes),    42)
        XCTAssertEqual(s.score(for: .ferrari),     10)
        XCTAssertEqual(s.score(for: .alpine),      15)
        XCTAssertEqual(s.score(for: .mcLaren),     21)
        XCTAssertEqual(s.score(for: .astonMartin),  3)
        XCTAssertEqual(s.score(for: .alfaRomeo),    0)
        XCTAssertEqual(s.score(for: .alphaTauri),   1)
        XCTAssertEqual(s.score(for: .williams),     0)
        XCTAssertEqual(s.score(for: .haas),         3)
    }

    func testConstructorScores_race() {
        XCTAssertEqual(s._raceScore(for: .redBull),     30)
        XCTAssertEqual(s._raceScore(for: .mercedes),    41)
        XCTAssertEqual(s._raceScore(for: .ferrari),      8)
        XCTAssertEqual(s._raceScore(for: .alpine),      10)
        XCTAssertEqual(s._raceScore(for: .mcLaren),     12)
        XCTAssertEqual(s._raceScore(for: .astonMartin),  0)
        XCTAssertEqual(s._raceScore(for: .alfaRomeo),    0)
        XCTAssertEqual(s._raceScore(for: .alphaTauri),   1)
        XCTAssertEqual(s._raceScore(for: .williams),     0)
        XCTAssertEqual(s._raceScore(for: .haas),         0)
    }

    func testConstructorScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .redBull),     1)
        XCTAssertEqual(s._bonusScore(for: .mercedes),    1)
        XCTAssertEqual(s._bonusScore(for: .ferrari),     2)
        XCTAssertEqual(s._bonusScore(for: .alpine),      5)
        XCTAssertEqual(s._bonusScore(for: .mcLaren),     9)
        XCTAssertEqual(s._bonusScore(for: .astonMartin), 3)
        XCTAssertEqual(s._bonusScore(for: .alfaRomeo),   0)
        XCTAssertEqual(s._bonusScore(for: .alphaTauri),  0)
        XCTAssertEqual(s._bonusScore(for: .williams),    0)
        XCTAssertEqual(s._bonusScore(for: .haas),        3)
    }
}
