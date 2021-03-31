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

}
