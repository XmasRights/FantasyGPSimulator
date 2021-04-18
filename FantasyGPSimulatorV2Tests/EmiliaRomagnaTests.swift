//
//  EmiliaRomagnaTests.swift
//  FantasyGPSimulatorV2Tests
//
//  Created by Christopher Fonseka on 18/04/2021.
//

import XCTest
@testable import FantasyGPSimulatorV2

class EmiliaRomagnaTests: XCTestCase {
    private let s = RaceScore(race: EmiliaRomagna())

    func testDriverScores() {
        XCTAssertEqual(s.score(for: .alonso), 9)
        XCTAssertEqual(s.score(for: .bottas), 0)
        XCTAssertEqual(s.score(for: .gasly), 9)
        XCTAssertEqual(s.score(for: .giovinazzi), 6)
        XCTAssertEqual(s.score(for: .hamilton), 34)
        XCTAssertEqual(s.score(for: .latifi), 0)
        XCTAssertEqual(s.score(for: .leclerc), 17)
        XCTAssertEqual(s.score(for: .mazepin), 3)
        XCTAssertEqual(s.score(for: .schumacher), 8)
        XCTAssertEqual(s.score(for: .norris), 27)
        XCTAssertEqual(s.score(for: .ocon), 6)
        XCTAssertEqual(s.score(for: .pérez), 5)
        XCTAssertEqual(s.score(for: .räikkönen), 25)
        XCTAssertEqual(s.score(for: .ricciardo), 13)
        XCTAssertEqual(s.score(for: .russell), 5)
        XCTAssertEqual(s.score(for: .sainz), 28)
        XCTAssertEqual(s.score(for: .stroll), 20)
        XCTAssertEqual(s.score(for: .tsunoda), 18)
        XCTAssertEqual(s.score(for: .verstappen), 31)
        XCTAssertEqual(s.score(for: .vettel), 15)
    }

    func testDriverScores_race() {
        XCTAssertEqual(s._raceScore(for: .alonso), 0)
        XCTAssertEqual(s._raceScore(for: .bottas), 0)
        XCTAssertEqual(s._raceScore(for: .gasly), 4)
        XCTAssertEqual(s._raceScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._raceScore(for: .hamilton), 19)
        XCTAssertEqual(s._raceScore(for: .latifi), 0)
        XCTAssertEqual(s._raceScore(for: .leclerc), 12)
        XCTAssertEqual(s._raceScore(for: .mazepin), 0)
        XCTAssertEqual(s._raceScore(for: .schumacher), 0)
        XCTAssertEqual(s._raceScore(for: .norris), 15)
        XCTAssertEqual(s._raceScore(for: .ocon), 1)
        XCTAssertEqual(s._raceScore(for: .pérez), 0)
        XCTAssertEqual(s._raceScore(for: .räikkönen), 2)
        XCTAssertEqual(s._raceScore(for: .ricciardo), 8)
        XCTAssertEqual(s._raceScore(for: .russell), 0)
        XCTAssertEqual(s._raceScore(for: .sainz), 10)
        XCTAssertEqual(s._raceScore(for: .stroll), 6)
        XCTAssertEqual(s._raceScore(for: .tsunoda), 0)
        XCTAssertEqual(s._raceScore(for: .verstappen), 25)
        XCTAssertEqual(s._raceScore(for: .vettel), 0)
    }

    func testDriverScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .alonso), 9)
        XCTAssertEqual(s._bonusScore(for: .bottas), 0)
        XCTAssertEqual(s._bonusScore(for: .gasly), 0)
        XCTAssertEqual(s._bonusScore(for: .giovinazzi), 6)
        XCTAssertEqual(s._bonusScore(for: .hamilton), 0)
        XCTAssertEqual(s._bonusScore(for: .latifi), 0)
        XCTAssertEqual(s._bonusScore(for: .leclerc), 0)
        XCTAssertEqual(s._bonusScore(for: .mazepin), 3)
        XCTAssertEqual(s._bonusScore(for: .schumacher), 3)
        XCTAssertEqual(s._bonusScore(for: .norris), 12)
        XCTAssertEqual(s._bonusScore(for: .ocon), 0)
        XCTAssertEqual(s._bonusScore(for: .pérez), 0)
        XCTAssertEqual(s._bonusScore(for: .räikkönen), 18)
        XCTAssertEqual(s._bonusScore(for: .ricciardo), 0)
        XCTAssertEqual(s._bonusScore(for: .russell), 0)
        XCTAssertEqual(s._bonusScore(for: .sainz), 18)
        XCTAssertEqual(s._bonusScore(for: .stroll), 9)
        XCTAssertEqual(s._bonusScore(for: .tsunoda), 18)
        XCTAssertEqual(s._bonusScore(for: .verstappen), 6)
        XCTAssertEqual(s._bonusScore(for: .vettel), 15)
    }

    func testDriverScores_quali() {
        XCTAssertEqual(s._qualiScore(for: .alonso), 0)
        XCTAssertEqual(s._qualiScore(for: .bottas), 0)
        XCTAssertEqual(s._qualiScore(for: .gasly), 5)
        XCTAssertEqual(s._qualiScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._qualiScore(for: .hamilton), 15)
        XCTAssertEqual(s._qualiScore(for: .latifi), 0)
        XCTAssertEqual(s._qualiScore(for: .leclerc), 5)
        XCTAssertEqual(s._qualiScore(for: .mazepin), 0)
        XCTAssertEqual(s._qualiScore(for: .schumacher), 5)
        XCTAssertEqual(s._qualiScore(for: .norris), 0)
        XCTAssertEqual(s._qualiScore(for: .ocon), 5)
        XCTAssertEqual(s._qualiScore(for: .pérez), 5)
        XCTAssertEqual(s._qualiScore(for: .räikkönen), 5)
        XCTAssertEqual(s._qualiScore(for: .ricciardo), 5)
        XCTAssertEqual(s._qualiScore(for: .russell), 5)
        XCTAssertEqual(s._qualiScore(for: .sainz), 0)
        XCTAssertEqual(s._qualiScore(for: .stroll), 5)
        XCTAssertEqual(s._qualiScore(for: .tsunoda), 0)
        XCTAssertEqual(s._qualiScore(for: .verstappen), 0)
        XCTAssertEqual(s._qualiScore(for: .vettel), 0)
    }


    func testConstructorScores() {
        XCTAssertEqual(s.score(for: .alfaRomeo), 10)
        XCTAssertEqual(s.score(for: .alphaTauri), 10)
        XCTAssertEqual(s.score(for: .alpine), 4)
        XCTAssertEqual(s.score(for: .astonMartin), 14)
        XCTAssertEqual(s.score(for: .ferrari), 28)
        XCTAssertEqual(s.score(for: .haas), 2)
        XCTAssertEqual(s.score(for: .mcLaren), 27)
        XCTAssertEqual(s.score(for: .mercedes), 19)
        XCTAssertEqual(s.score(for: .redBull), 27)
        XCTAssertEqual(s.score(for: .williams), 0)
    }

    func testConstructorScores_race() {
        XCTAssertEqual(s._raceScore(for: .alfaRomeo), 2)
        XCTAssertEqual(s._raceScore(for: .alphaTauri), 4)
        XCTAssertEqual(s._raceScore(for: .alpine), 1)
        XCTAssertEqual(s._raceScore(for: .astonMartin), 6)
        XCTAssertEqual(s._raceScore(for: .ferrari), 22)
        XCTAssertEqual(s._raceScore(for: .haas), 0)
        XCTAssertEqual(s._raceScore(for: .mcLaren), 23)
        XCTAssertEqual(s._raceScore(for: .mercedes), 19)
        XCTAssertEqual(s._raceScore(for: .redBull), 25)
        XCTAssertEqual(s._raceScore(for: .williams), 0)
    }

    func testConstructorScores_bonus() {
        XCTAssertEqual(s._bonusScore(for: .alfaRomeo), 8)
        XCTAssertEqual(s._bonusScore(for: .alphaTauri), 6)
        XCTAssertEqual(s._bonusScore(for: .alpine), 3)
        XCTAssertEqual(s._bonusScore(for: .astonMartin), 8)
        XCTAssertEqual(s._bonusScore(for: .ferrari), 6)
        XCTAssertEqual(s._bonusScore(for: .haas), 2)
        XCTAssertEqual(s._bonusScore(for: .mcLaren), 4)
        XCTAssertEqual(s._bonusScore(for: .mercedes), 0)
        XCTAssertEqual(s._bonusScore(for: .redBull), 2)
        XCTAssertEqual(s._bonusScore(for: .williams), 0)
    }
}
