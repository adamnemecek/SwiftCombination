//
//  CombinationTests.swift
//  SwiftCombination
//
//  Created by Keita Okamoto on 2017/07/01.
//
//
import XCTest
import SwiftCombination

final class GlobalCombinationTests: SwiftCombinationTests {}

extension GlobalCombinationTests {
    func testExplicitLength() {
        let actual = combination([0, 1, 2], length: 3)
        let expected = [[0, 1, 2]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthLessThanCollectionLength() {
        let actual = combination([0, 1, 2], length: 2)
        let expected = [[0, 1], [0, 2], [1, 2]]
        XCTAssertEqual(actual.count, expected.count)
        zip(actual, expected).forEach { XCTAssertEqual($0, $1) }
    }

    func testArgLengthGreaterThanCollectionLength() {
        let actual = combination([0, 1, 2], length: 4)
        XCTAssertTrue(actual.isEmpty)
    }

    func testExplicitLengthWithClosure() {
        let expected = [[0, 1, 2]]
        var i = 0
        combination([0, 1, 2], length: 3) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthLessThanCollectionLengthWithClosure() {
        let expected = [[0, 1], [0, 2], [1, 2]]
        var i = 0
        combination([0, 1, 2], length: 2) { actual in
            XCTAssertEqual(actual, expected[i])
            i = i + 1
        }
        XCTAssertNotEqual(i, 0)
    }

    func testArgLengthGreaterThanCollectionLengthWithClosure() {
        var i = 0
        combination([0, 1, 2], length: 4) { _ in i = i + 1 }
        XCTAssertEqual(i, 0)
    }

    static var allTests = [
        ("testExplicitLength", testExplicitLength),
        ("testArgLengthLessThanCollectionLength", testArgLengthLessThanCollectionLength),
        ("testArgLengthGreaterThanCollectionLength", testArgLengthGreaterThanCollectionLength),
        ("testExplicitLengthWithClosure", testExplicitLengthWithClosure),
        ("testArgLengthLessThanCollectionLengthWithClosure", testArgLengthLessThanCollectionLengthWithClosure),
        ("testArgLengthGreaterThanCollectionLengthWithClosure", testArgLengthGreaterThanCollectionLengthWithClosure),
    ]
}
