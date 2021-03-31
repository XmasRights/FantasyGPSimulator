//
//  BahrainTests.swift
//  FantasyGPSimulatorV2Tests
//
//  Created by Christopher Fonseka on 31/03/2021.
//

import XCTest
@testable import FantasyGPSimulatorV2

class BahrainTests: XCTestCase {
    func testDriverScores() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s.score(for: .verstappen), 33)
        XCTAssertEqual(s.score(for: .pérez), 55)
        XCTAssertEqual(s.score(for: .bottas), 16)
        XCTAssertEqual(s.score(for: .hamilton), 33)
        XCTAssertEqual(s.score(for: .leclerc), 13)
        XCTAssertEqual(s.score(for: .sainz), 4)
        XCTAssertEqual(s.score(for: .alonso), 5)
        XCTAssertEqual(s.score(for: .ocon), 6)
        XCTAssertEqual(s.score(for: .norris), 21)
        XCTAssertEqual(s.score(for: .ricciardo), 11)
        XCTAssertEqual(s.score(for: .vettel), 12)
        XCTAssertEqual(s.score(for: .stroll), 6)
        XCTAssertEqual(s.score(for: .räikkönen), 6)
        XCTAssertEqual(s.score(for: .giovinazzi), 5)
        XCTAssertEqual(s.score(for: .tsunoda), 11)
        XCTAssertEqual(s.score(for: .gasly), 5)
        XCTAssertEqual(s.score(for: .latifi), 0)
        XCTAssertEqual(s.score(for: .russell), 5)
        XCTAssertEqual(s.score(for: .schumacher), 8)
        XCTAssertEqual(s.score(for: .mazepin), 0)
    }

    func testDriverScores_race() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s._raceScore(for: .verstappen), 18)
        XCTAssertEqual(s._raceScore(for: .pérez), 10)
        XCTAssertEqual(s._raceScore(for: .bottas), 16)
        XCTAssertEqual(s._raceScore(for: .hamilton), 25)
        XCTAssertEqual(s._raceScore(for: .leclerc), 8)
        XCTAssertEqual(s._raceScore(for: .sainz), 4)
        XCTAssertEqual(s._raceScore(for: .alonso), 0)
        XCTAssertEqual(s._raceScore(for: .ocon), 0)
        XCTAssertEqual(s._raceScore(for: .norris), 12)
        XCTAssertEqual(s._raceScore(for: .ricciardo), 6)
        XCTAssertEqual(s._raceScore(for: .vettel), 0)
        XCTAssertEqual(s._raceScore(for: .stroll), 1)
        XCTAssertEqual(s._raceScore(for: .räikkönen), 0)
        XCTAssertEqual(s._raceScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._raceScore(for: .tsunoda), 2)
        XCTAssertEqual(s._raceScore(for: .gasly), 0)
        XCTAssertEqual(s._raceScore(for: .latifi), 0)
        XCTAssertEqual(s._raceScore(for: .russell), 0)
        XCTAssertEqual(s._raceScore(for: .schumacher), 0)
        XCTAssertEqual(s._raceScore(for: .mazepin), 0)
    }

    func testDriverScores_bonus() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s._bonusScore(for: .verstappen), 0)
        XCTAssertEqual(s._bonusScore(for: .pérez), 45)
        XCTAssertEqual(s._bonusScore(for: .bottas), 0)
        XCTAssertEqual(s._bonusScore(for: .hamilton), 3)
        XCTAssertEqual(s._bonusScore(for: .leclerc), 0)
        XCTAssertEqual(s._bonusScore(for: .sainz), 0)
        XCTAssertEqual(s._bonusScore(for: .alonso), 0)
        XCTAssertEqual(s._bonusScore(for: .ocon), 6)
        XCTAssertEqual(s._bonusScore(for: .norris), 9)
        XCTAssertEqual(s._bonusScore(for: .ricciardo), 0)
        XCTAssertEqual(s._bonusScore(for: .vettel), 12)
        XCTAssertEqual(s._bonusScore(for: .stroll), 0)
        XCTAssertEqual(s._bonusScore(for: .räikkönen), 6)
        XCTAssertEqual(s._bonusScore(for: .giovinazzi), 0)
        XCTAssertEqual(s._bonusScore(for: .tsunoda), 9)
        XCTAssertEqual(s._bonusScore(for: .gasly), 0)
        XCTAssertEqual(s._bonusScore(for: .latifi), 0)
        XCTAssertEqual(s._bonusScore(for: .russell), 0)
        XCTAssertEqual(s._bonusScore(for: .schumacher), 3)
        XCTAssertEqual(s._bonusScore(for: .mazepin), 0)
    }

    func testDriverScores_quali() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s._qualiScore(for: .verstappen), 15)
        XCTAssertEqual(s._qualiScore(for: .pérez), 0)
        XCTAssertEqual(s._qualiScore(for: .bottas), 0)
        XCTAssertEqual(s._qualiScore(for: .hamilton), 5)
        XCTAssertEqual(s._qualiScore(for: .leclerc), 5)
        XCTAssertEqual(s._qualiScore(for: .sainz), 0)
        XCTAssertEqual(s._qualiScore(for: .alonso), 5)
        XCTAssertEqual(s._qualiScore(for: .ocon), 0)
        XCTAssertEqual(s._qualiScore(for: .norris), 0)
        XCTAssertEqual(s._qualiScore(for: .ricciardo), 5)
        XCTAssertEqual(s._qualiScore(for: .vettel), 0)
        XCTAssertEqual(s._qualiScore(for: .stroll), 5)
        XCTAssertEqual(s._qualiScore(for: .räikkönen), 0)
        XCTAssertEqual(s._qualiScore(for: .giovinazzi), 5)
        XCTAssertEqual(s._qualiScore(for: .tsunoda), 0)
        XCTAssertEqual(s._qualiScore(for: .gasly), 5)
        XCTAssertEqual(s._qualiScore(for: .latifi), 0)
        XCTAssertEqual(s._qualiScore(for: .russell), 5)
        XCTAssertEqual(s._qualiScore(for: .schumacher), 5)
        XCTAssertEqual(s._qualiScore(for: .mazepin), 0)
    }


    func testConstructorScores() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s.score(for: .redBull), 43)
        XCTAssertEqual(s.score(for: .mercedes), 42)
        XCTAssertEqual(s.score(for: .ferrari), 12)
        XCTAssertEqual(s.score(for: .alpine), 2)
        XCTAssertEqual(s.score(for: .mcLaren), 21)
        XCTAssertEqual(s.score(for: .astonMartin), 5)
        XCTAssertEqual(s.score(for: .alfaRomeo), 2)
        XCTAssertEqual(s.score(for: .alphaTauri), 5)
        XCTAssertEqual(s.score(for: .williams), 0)
        XCTAssertEqual(s.score(for: .haas), 1)
    }

    func testConstructorScores_race() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s._raceScore(for: .redBull), 28)
        XCTAssertEqual(s._raceScore(for: .mercedes), 41)
        XCTAssertEqual(s._raceScore(for: .ferrari), 12)
        XCTAssertEqual(s._raceScore(for: .alpine), 0)
        XCTAssertEqual(s._raceScore(for: .mcLaren), 18)
        XCTAssertEqual(s._raceScore(for: .astonMartin), 1)
        XCTAssertEqual(s._raceScore(for: .alfaRomeo), 0)
        XCTAssertEqual(s._raceScore(for: .alphaTauri), 2)
        XCTAssertEqual(s._raceScore(for: .williams), 0)
        XCTAssertEqual(s._raceScore(for: .haas), 0)
    }

    func testConstructorScores_bonus() {
        let s = Score(race: Bahrain())

        XCTAssertEqual(s._bonusScore(for: .redBull), 15)
        XCTAssertEqual(s._bonusScore(for: .mercedes), 1)
        XCTAssertEqual(s._bonusScore(for: .ferrari), 0)
        XCTAssertEqual(s._bonusScore(for: .alpine), 2)
        XCTAssertEqual(s._bonusScore(for: .mcLaren), 3)
        XCTAssertEqual(s._bonusScore(for: .astonMartin), 4)
        XCTAssertEqual(s._bonusScore(for: .alfaRomeo), 2)
        XCTAssertEqual(s._bonusScore(for: .alphaTauri), 3)
        XCTAssertEqual(s._bonusScore(for: .williams), 0)
        XCTAssertEqual(s._bonusScore(for: .haas), 1)
    }
}
