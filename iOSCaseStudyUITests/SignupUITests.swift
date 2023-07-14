//
//  SignupUITests.swift
//  iOSCaseStudyUITests
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import XCTest

final class SignupUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testViewsOnScreen() throws {
        XCTAssertNotNil(app.staticTexts["signup title"])

        let emailTextfield = app.textFields["email textfield"]
        XCTAssertNotNil(emailTextfield)
        
        let nameTextfield = app.textFields["name textfield"]
        XCTAssertNotNil(nameTextfield)

        let passwordTextfield = app.textFields["password textfield"]
        XCTAssertNotNil(passwordTextfield)

        let signupButton = app.buttons["signup button"]
        XCTAssertNotNil(signupButton)

        let doneButton = app.buttons["done"]
        XCTAssertNotNil(doneButton)

        // Tap on textfield
        nameTextfield.tap()
        XCTAssertGreaterThan(app.keyboards.count, 0)

        doneButton.tap()
        XCTAssertEqual(app.keyboards.count, 0)
    }

    func testEditingFields() {
        let emailTextfield = app.textFields["email textfield"]
        XCTAssertNotNil(emailTextfield)

        let nameTextfield = app.textFields["name textfield"]
        XCTAssertNotNil(nameTextfield)
        
        let signupButton = app.buttons["signup button"]
        XCTAssertNotNil(signupButton)

        emailTextfield.tap()
        emailTextfield.typeText("a@a.com")
        signupButton.tap()
        
        // Alert is shown
        let okButtonAlert = app.buttons["Ok"]
        XCTAssertNotNil(okButtonAlert)
        okButtonAlert.tap()
        
        nameTextfield.tap()
        nameTextfield.typeText("Abc")
        signupButton.tap()

        // Alert ok pressed
        XCTAssertNotNil(okButtonAlert)
        okButtonAlert.tap()
    }
}
