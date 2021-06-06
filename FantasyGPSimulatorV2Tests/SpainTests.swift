//
//  Spain.swift
//  FantasyGPSimulatorV2Tests
//
//  Created by Christopher Fonseka on 06/06/2021.
//

import XCTest
@testable import FantasyGPSimulatorV2

class SpainTests: XCTestCase {
    private let s = RaceScore(race: Spain())!

    func testDriverScores() {
        XCTAssertEqual(s.score(for: .verstappen), 24)
        XCTAssertEqual(s.score(for: .pérez),      19)
        XCTAssertEqual(s.score(for: .bottas),     15)
        XCTAssertEqual(s.score(for: .hamilton),   40)
        XCTAssertEqual(s.score(for: .leclerc),    17)
        XCTAssertEqual(s.score(for: .sainz),      6)
        XCTAssertEqual(s.score(for: .alonso),     0)
        XCTAssertEqual(s.score(for: .ocon),       7)
        XCTAssertEqual(s.score(for: .norris),     7)
        XCTAssertEqual(s.score(for: .ricciardo),  16)
        XCTAssertEqual(s.score(for: .vettel),     0)
        XCTAssertEqual(s.score(for: .stroll),     5)
        XCTAssertEqual(s.score(for: .räikkönen),  15)
        XCTAssertEqual(s.score(for: .giovinazzi), 5)
        XCTAssertEqual(s.score(for: .tsunoda),    0)
        XCTAssertEqual(s.score(for: .gasly),      12)
        XCTAssertEqual(s.score(for: .latifi),     9)
        XCTAssertEqual(s.score(for: .russell),    8)
        XCTAssertEqual(s.score(for: .schumacher), 5)
        XCTAssertEqual(s.score(for: .mazepin),    3)
    }

    func testDriverScores_race() {
        XCTAssertEqual(s._raceScore(for: .verstappen), 19)
        XCTAssertEqual(s._raceScore(for: .pérez),      10)
        XCTAssertEqual(s._raceScore(for: .bottas),     15)
        XCTAssertEqual(s._raceScore(for: .hamilton),   25)
        XCTAssertEqual(s._raceScore(for: .leclerc),    12)
        XCTAssertEqual(s._raceScore(for: .sainz),      6)
        XCTAssertEqual(s._raceScore(for: .alonso),     0)
        XCTAssertEqual(s._raceScore(for: .ocon),       2)
        XCTAssertEqual(s._raceScore(for: .norris),     4)
        XCTAssertEqual(s._raceScore(for: .ricciardo),  8)
        XCTAssertEqual(s._raceScore(for: .vettel),     0)
        XCTAssertEqual(s._raceScore(for: .stroll),     0)
        XCTAssertEqual(s._raceScore(for: .räikkönen),  0)
        XCTAssertEqual(s._raceScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._raceScore(for: .tsunoda),    0)
        XCTAssertEqual(s._raceScore(for: .gasly),      1)
        XCTAssertEqual(s._raceScore(for: .latifi),     0)
        XCTAssertEqual(s._raceScore(for: .russell),    0)
        XCTAssertEqual(s._raceScore(for: .schumacher), 0)
        XCTAssertEqual(s._raceScore(for: .mazepin),    0)
    }

    func testDriverScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .verstappen), 0)
        XCTAssertEqual(s._bonusScore(for: .pérez),      9)
        XCTAssertEqual(s._bonusScore(for: .bottas),     0)
        XCTAssertEqual(s._bonusScore(for: .hamilton),   0)
        XCTAssertEqual(s._bonusScore(for: .leclerc),    0)
        XCTAssertEqual(s._bonusScore(for: .sainz),      0)
        XCTAssertEqual(s._bonusScore(for: .alonso),     0)
        XCTAssertEqual(s._bonusScore(for: .ocon),       0)
        XCTAssertEqual(s._bonusScore(for: .norris),     3)
        XCTAssertEqual(s._bonusScore(for: .ricciardo),  3)
        XCTAssertEqual(s._bonusScore(for: .vettel),     0)
        XCTAssertEqual(s._bonusScore(for: .stroll),     0)
        XCTAssertEqual(s._bonusScore(for: .räikkönen),  15)
        XCTAssertEqual(s._bonusScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._bonusScore(for: .tsunoda),    0)
        XCTAssertEqual(s._bonusScore(for: .gasly),      6)
        XCTAssertEqual(s._bonusScore(for: .latifi),     9)
        XCTAssertEqual(s._bonusScore(for: .russell),    3)
        XCTAssertEqual(s._bonusScore(for: .schumacher), 0)
        XCTAssertEqual(s._bonusScore(for: .mazepin),    3)
    }

    func testDriverScores_quali() {
        XCTAssertEqual(s._qualiScore(for: .verstappen), 5)
        XCTAssertEqual(s._qualiScore(for: .pérez),      0)
        XCTAssertEqual(s._qualiScore(for: .bottas),     0)
        XCTAssertEqual(s._qualiScore(for: .hamilton),   15)
        XCTAssertEqual(s._qualiScore(for: .leclerc),    5)
        XCTAssertEqual(s._qualiScore(for: .sainz),      0)
        XCTAssertEqual(s._qualiScore(for: .alonso),     0)
        XCTAssertEqual(s._qualiScore(for: .ocon),       5)
        XCTAssertEqual(s._qualiScore(for: .norris),     0)
        XCTAssertEqual(s._qualiScore(for: .ricciardo),  5)
        XCTAssertEqual(s._qualiScore(for: .vettel),     0)
        XCTAssertEqual(s._qualiScore(for: .stroll),     5)
        XCTAssertEqual(s._qualiScore(for: .räikkönen),  0)
        XCTAssertEqual(s._qualiScore(for: .giovinazzi), 5)
        XCTAssertEqual(s._qualiScore(for: .tsunoda),    0)
        XCTAssertEqual(s._qualiScore(for: .gasly),      5)
        XCTAssertEqual(s._qualiScore(for: .latifi),     0)
        XCTAssertEqual(s._qualiScore(for: .russell),    5)
        XCTAssertEqual(s._qualiScore(for: .schumacher), 5)
        XCTAssertEqual(s._qualiScore(for: .mazepin),    0)
    }


    func testConstructorScores() {
        XCTAssertEqual(s.score(for: .redBull),     32)
        XCTAssertEqual(s.score(for: .mercedes),    40)
        XCTAssertEqual(s.score(for: .ferrari),     18)
        XCTAssertEqual(s.score(for: .alpine),      2)
        XCTAssertEqual(s.score(for: .mcLaren),     14)
        XCTAssertEqual(s.score(for: .astonMartin), 0)
        XCTAssertEqual(s.score(for: .alfaRomeo),   5)
        XCTAssertEqual(s.score(for: .alphaTauri),  3)
        XCTAssertEqual(s.score(for: .williams),    4)
        XCTAssertEqual(s.score(for: .haas),        1)
    }

    func testConstructorScores_race() {
        XCTAssertEqual(s._raceScore(for: .redBull),     29)
        XCTAssertEqual(s._raceScore(for: .mercedes),    40)
        XCTAssertEqual(s._raceScore(for: .ferrari),     18)
        XCTAssertEqual(s._raceScore(for: .alpine),      2)
        XCTAssertEqual(s._raceScore(for: .mcLaren),     12)
        XCTAssertEqual(s._raceScore(for: .astonMartin), 0)
        XCTAssertEqual(s._raceScore(for: .alfaRomeo),   0)
        XCTAssertEqual(s._raceScore(for: .alphaTauri),  1)
        XCTAssertEqual(s._raceScore(for: .williams),    0)
        XCTAssertEqual(s._raceScore(for: .haas),        0)
    }

    func testConstructorScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .redBull),     3)
        XCTAssertEqual(s._bonusScore(for: .mercedes),    0)
        XCTAssertEqual(s._bonusScore(for: .ferrari),     0)
        XCTAssertEqual(s._bonusScore(for: .alpine),      0)
        XCTAssertEqual(s._bonusScore(for: .mcLaren),     2)
        XCTAssertEqual(s._bonusScore(for: .astonMartin), 0)
        XCTAssertEqual(s._bonusScore(for: .alfaRomeo),   5)
        XCTAssertEqual(s._bonusScore(for: .alphaTauri),  2)
        XCTAssertEqual(s._bonusScore(for: .williams),    4)
        XCTAssertEqual(s._bonusScore(for: .haas),        1)
    }
}
