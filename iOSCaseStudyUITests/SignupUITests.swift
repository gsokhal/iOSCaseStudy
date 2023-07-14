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

        let nameTextfield = app.textFields["name textfield"]
        XCTAssertNotNil(nameTextfield)

        let emailTextfield = app.textFields["email textfield"]
        XCTAssertNotNil(emailTextfield)

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
        let nameTextfield = app.textFields["name textfield"]
        XCTAssertNotNil(nameTextfield)

        let emailTextfield = app.textFields["email textfield"]
        XCTAssertNotNil(emailTextfield)

        let signupButton = app.buttons["signup button"]
        XCTAssertNotNil(signupButton)

        // navigating after filling half detaitls, it will not navigate
        nameTextfield.tap()
        nameTextfield.typeText("Abc")
        signupButton.tap()

        // Alert is shown
        let okButtonAlert = app.buttons["Ok"]
        XCTAssertNotNil(okButtonAlert)
        okButtonAlert.tap()

        // Navigating after filling all details
        emailTextfield.tap()
        emailTextfield.typeText("a@a.com")
        signupButton.tap()

        // Alert ok pressed
        XCTAssertNotNil(okButtonAlert)
        okButtonAlert.tap()
    }
}
