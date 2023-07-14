//
//  SigupViewModelTest.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import XCTest
@testable import iOSCaseStudy

final class SigupViewModelTest: XCTestCase {
    let viewModel = SignupViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidName() {
        XCTAssertTrue(viewModel.isValidName(name: "ABC"))
        XCTAssertTrue(viewModel.isValidName(name: "A A"))
        XCTAssertTrue(viewModel.isValidName(name: "ABC XYZ"))
        XCTAssertTrue(viewModel.isValidName(name: "qwerty 123"))
    }

    func testIsInvalidName() {
        XCTAssertFalse(viewModel.isValidName(name: ""))
        XCTAssertFalse(viewModel.isValidName(name: "   "))
        XCTAssertFalse(viewModel.isValidName(name: "  A"))
        XCTAssertFalse(viewModel.isValidName(name: "A  "))
        XCTAssertFalse(viewModel.isValidName(name: " A "))
    }

    func testIsValidEmail() {
        XCTAssertTrue(viewModel.isValidEmail(email: "a@a.com"))
        XCTAssertTrue(viewModel.isValidEmail(email: "a@xyz.co"))
        XCTAssertTrue(viewModel.isValidEmail(email: "xyz@g.co.in"))
    }

    func testIsInvalidEmail() {
        XCTAssertFalse(viewModel.isValidEmail(email: ""))
        XCTAssertFalse(viewModel.isValidEmail(email: "   "))
        XCTAssertFalse(viewModel.isValidEmail(email: "a.com"))
        XCTAssertFalse(viewModel.isValidEmail(email: "a@aaaa"))
        XCTAssertFalse(viewModel.isValidEmail(email: "a.a@"))
    }

    func testIsValidPassword() {
        XCTAssertTrue(viewModel.isValidPassword(password: "12345678A$"))
        XCTAssertTrue(viewModel.isValidPassword(password: "$$$$$$$$A1"))
        XCTAssertTrue(viewModel.isValidPassword(password: "Aaaaare1%"))
    }

    func testIsInvalidPassword() {
        XCTAssertFalse(viewModel.isValidPassword(password: ""))
        XCTAssertFalse(viewModel.isValidPassword(password: "        "))
        XCTAssertFalse(viewModel.isValidPassword(password: "12345678"))
        XCTAssertFalse(viewModel.isValidPassword(password: "1234567A"))
        XCTAssertFalse(viewModel.isValidPassword(password: "12345678$$@"))
    }
}
