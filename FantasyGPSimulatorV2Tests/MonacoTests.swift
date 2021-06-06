//
//  MonacoTests.swift
//  FantasyGPSimulatorV2Tests
//
//  Created by Christopher Fonseka on 06/06/2021.
//

import XCTest
@testable import FantasyGPSimulatorV2

class MonacoTests: XCTestCase {
    private let s = RaceScore(race: Monaco())!

    func testDriverScores() {
        XCTAssertEqual(s.score(for: .verstappen), 40)
        XCTAssertEqual(s.score(for: .pérez),      24)
        XCTAssertEqual(s.score(for: .bottas),     5)
        XCTAssertEqual(s.score(for: .hamilton),   7)
        XCTAssertEqual(s.score(for: .leclerc),    0)
        XCTAssertEqual(s.score(for: .sainz),      26)
        XCTAssertEqual(s.score(for: .alonso),     9)
        XCTAssertEqual(s.score(for: .ocon),       10)
        XCTAssertEqual(s.score(for: .norris),     23)
        XCTAssertEqual(s.score(for: .ricciardo),  0)
        XCTAssertEqual(s.score(for: .vettel),     21)
        XCTAssertEqual(s.score(for: .stroll),     16)
        XCTAssertEqual(s.score(for: .räikkönen),  6)
        XCTAssertEqual(s.score(for: .giovinazzi), 9)
        XCTAssertEqual(s.score(for: .tsunoda),    3)
        XCTAssertEqual(s.score(for: .gasly),      13)
        XCTAssertEqual(s.score(for: .latifi),     6)
        XCTAssertEqual(s.score(for: .russell),    5)
        XCTAssertEqual(s.score(for: .schumacher), 3)
        XCTAssertEqual(s.score(for: .mazepin),    8)
    }

    func testDriverScores_race() {
        XCTAssertEqual(s._raceScore(for: .verstappen), 25)
        XCTAssertEqual(s._raceScore(for: .pérez),      12)
        XCTAssertEqual(s._raceScore(for: .bottas),     0)
        XCTAssertEqual(s._raceScore(for: .hamilton),   7)
        XCTAssertEqual(s._raceScore(for: .leclerc),    0)
        XCTAssertEqual(s._raceScore(for: .sainz),      18)
        XCTAssertEqual(s._raceScore(for: .alonso),     0)
        XCTAssertEqual(s._raceScore(for: .ocon),       2)
        XCTAssertEqual(s._raceScore(for: .norris),     15)
        XCTAssertEqual(s._raceScore(for: .ricciardo),  0)
        XCTAssertEqual(s._raceScore(for: .vettel),     10)
        XCTAssertEqual(s._raceScore(for: .stroll),     4)
        XCTAssertEqual(s._raceScore(for: .räikkönen),  0)
        XCTAssertEqual(s._raceScore(for: .giovinazzi), 1)
        XCTAssertEqual(s._raceScore(for: .tsunoda),    0)
        XCTAssertEqual(s._raceScore(for: .gasly),      8)
        XCTAssertEqual(s._raceScore(for: .latifi),     0)
        XCTAssertEqual(s._raceScore(for: .russell),    0)
        XCTAssertEqual(s._raceScore(for: .schumacher), 0)
        XCTAssertEqual(s._raceScore(for: .mazepin),    0)
    }

    func testDriverScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .verstappen), 0)
        XCTAssertEqual(s._bonusScore(for: .pérez),      12)
        XCTAssertEqual(s._bonusScore(for: .bottas),     0)
        XCTAssertEqual(s._bonusScore(for: .hamilton),   0)
        XCTAssertEqual(s._bonusScore(for: .leclerc),    0)
        XCTAssertEqual(s._bonusScore(for: .sainz),      3)
        XCTAssertEqual(s._bonusScore(for: .alonso),     9)
        XCTAssertEqual(s._bonusScore(for: .ocon),       3)
        XCTAssertEqual(s._bonusScore(for: .norris),     3)
        XCTAssertEqual(s._bonusScore(for: .ricciardo),  0)
        XCTAssertEqual(s._bonusScore(for: .vettel),     6)
        XCTAssertEqual(s._bonusScore(for: .stroll),     12)
        XCTAssertEqual(s._bonusScore(for: .räikkönen),  6)
        XCTAssertEqual(s._bonusScore(for: .giovinazzi), 3)
        XCTAssertEqual(s._bonusScore(for: .tsunoda),    3)
        XCTAssertEqual(s._bonusScore(for: .gasly),      0)
        XCTAssertEqual(s._bonusScore(for: .latifi),     6)
        XCTAssertEqual(s._bonusScore(for: .russell),    0)
        XCTAssertEqual(s._bonusScore(for: .schumacher), 3)
        XCTAssertEqual(s._bonusScore(for: .mazepin),    3)
    }

    func testDriverScores_quali() {
        XCTAssertEqual(s._qualiScore(for: .verstappen), 15)
        XCTAssertEqual(s._qualiScore(for: .pérez),      0)
        XCTAssertEqual(s._qualiScore(for: .bottas),     5)
        XCTAssertEqual(s._qualiScore(for: .hamilton),   0)
        XCTAssertEqual(s._qualiScore(for: .leclerc),    0)
        XCTAssertEqual(s._qualiScore(for: .sainz),      5)
        XCTAssertEqual(s._qualiScore(for: .alonso),     0)
        XCTAssertEqual(s._qualiScore(for: .ocon),       5)
        XCTAssertEqual(s._qualiScore(for: .norris),     5)
        XCTAssertEqual(s._qualiScore(for: .ricciardo),  0)
        XCTAssertEqual(s._qualiScore(for: .vettel),     5)
        XCTAssertEqual(s._qualiScore(for: .stroll),     0)
        XCTAssertEqual(s._qualiScore(for: .räikkönen),  0)
        XCTAssertEqual(s._qualiScore(for: .giovinazzi), 5)
        XCTAssertEqual(s._qualiScore(for: .tsunoda),    0)
        XCTAssertEqual(s._qualiScore(for: .gasly),      5)
        XCTAssertEqual(s._qualiScore(for: .latifi),     0)
        XCTAssertEqual(s._qualiScore(for: .russell),    5)
        XCTAssertEqual(s._qualiScore(for: .schumacher), 0)
        XCTAssertEqual(s._qualiScore(for: .mazepin),    5)
    }


    func testConstructorScores() {
        XCTAssertEqual(s.score(for: .redBull),     41)
        XCTAssertEqual(s.score(for: .mercedes),    7)
        XCTAssertEqual(s.score(for: .ferrari),     19)
        XCTAssertEqual(s.score(for: .alpine),      6)
        XCTAssertEqual(s.score(for: .mcLaren),     16)
        XCTAssertEqual(s.score(for: .astonMartin), 20)
        XCTAssertEqual(s.score(for: .alfaRomeo),   4)
        XCTAssertEqual(s.score(for: .alphaTauri),  9)
        XCTAssertEqual(s.score(for: .williams),    2)
        XCTAssertEqual(s.score(for: .haas),        2)
    }

    func testConstructorScores_race() {
        XCTAssertEqual(s._raceScore(for: .redBull),     37)
        XCTAssertEqual(s._raceScore(for: .mercedes),    7)
        XCTAssertEqual(s._raceScore(for: .ferrari),     18)
        XCTAssertEqual(s._raceScore(for: .alpine),      2)
        XCTAssertEqual(s._raceScore(for: .mcLaren),     15)
        XCTAssertEqual(s._raceScore(for: .astonMartin), 14)
        XCTAssertEqual(s._raceScore(for: .alfaRomeo),   1)
        XCTAssertEqual(s._raceScore(for: .alphaTauri),  8)
        XCTAssertEqual(s._raceScore(for: .williams),    0)
        XCTAssertEqual(s._raceScore(for: .haas),        0)
    }

    func testConstructorScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .redBull),     4)
        XCTAssertEqual(s._bonusScore(for: .mercedes),    0)
        XCTAssertEqual(s._bonusScore(for: .ferrari),     1)
        XCTAssertEqual(s._bonusScore(for: .alpine),      4)
        XCTAssertEqual(s._bonusScore(for: .mcLaren),     1)
        XCTAssertEqual(s._bonusScore(for: .astonMartin), 6)
        XCTAssertEqual(s._bonusScore(for: .alfaRomeo),   3)
        XCTAssertEqual(s._bonusScore(for: .alphaTauri),  1)
        XCTAssertEqual(s._bonusScore(for: .williams),    2)
        XCTAssertEqual(s._bonusScore(for: .haas),        2)
    }
}
