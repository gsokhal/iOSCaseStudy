//
//  SigupViewModelTest.swift
//  iOSCaseStudyTests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import XCTest
@testable import iOSCaseStudy

final class SigupViewModelTest: XCTestCase {
    let mockViewModel = SignupViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidName() {
        // empty name
        XCTAssertFalse(mockViewModel.isValidName(name: ""))
        // name with spaces
        XCTAssertFalse(mockViewModel.isValidName(name: "   "))
        // name with leading spaces
        XCTAssertFalse(mockViewModel.isValidName(name: "  A"))
        // name with trailling spaces
        XCTAssertFalse(mockViewModel.isValidName(name: "A  "))
        // name with leading and trailling spaces
        XCTAssertFalse(mockViewModel.isValidName(name: " A "))
        
        // valid name
        XCTAssertTrue(mockViewModel.isValidName(name: "ABC"))
        XCTAssertTrue(mockViewModel.isValidName(name: "A A"))
        XCTAssertTrue(mockViewModel.isValidName(name: "ABC XYZ"))
        XCTAssertTrue(mockViewModel.isValidName(name: "qwerty 123"))
    }
    
    func testIsValidEmail() {
        // invalid cases
        XCTAssertFalse(mockViewModel.isValidEmail(email: ""))
        XCTAssertFalse(mockViewModel.isValidEmail(email: "   "))
        XCTAssertFalse(mockViewModel.isValidEmail(email: "a.com"))
        XCTAssertFalse(mockViewModel.isValidEmail(email: "a@aaaa"))
        XCTAssertFalse(mockViewModel.isValidEmail(email: "a.a@"))
        
        // valid cases
        XCTAssertTrue(mockViewModel.isValidEmail(email: "a@a.com"))
        XCTAssertTrue(mockViewModel.isValidEmail(email: "a@xyz.co"))
        XCTAssertTrue(mockViewModel.isValidEmail(email: "xyz@g.co.in"))
    }
    
    func testIsValidPassword() {
        // invalid cases
        XCTAssertFalse(mockViewModel.isValidPassword(password: ""))
        XCTAssertFalse(mockViewModel.isValidPassword(password: "        "))
        XCTAssertFalse(mockViewModel.isValidPassword(password: "12345678"))
        XCTAssertFalse(mockViewModel.isValidPassword(password: "1234567A"))
        XCTAssertFalse(mockViewModel.isValidPassword(password: "12345678$$@"))
        
        // valid cases
        XCTAssertTrue(mockViewModel.isValidPassword(password: "12345678A$"))
        XCTAssertTrue(mockViewModel.isValidPassword(password: "$$$$$$$$A1"))
        XCTAssertTrue(mockViewModel.isValidPassword(password: "Aaaaare1%"))
    }
}
