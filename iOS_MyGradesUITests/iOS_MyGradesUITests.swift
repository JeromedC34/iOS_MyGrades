//
//  iOS_MyGradesUITests.swift
//  iOS_MyGradesUITests
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import XCTest

class iOS_MyGradesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let addButton = app.navigationBars["Subjects - No note yet"].buttons["Add"]
        let addSubjectNavigationBar = app.navigationBars["Add subject"]
        let saveButton = addSubjectNavigationBar.buttons["Save"]
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element(boundBy: 0)
        let textField2 = element.children(matching: .textField).element(boundBy: 1)
        let sportNoNoteYetStaticText = app.tables.staticTexts["Sport - No note yet"]
        let sportNoNoteYetNavigationBar = app.navigationBars["Sport - No note yet"]
        let valueTextField = app.textFields["Value"]
        let coefficientTextField = app.textFields["Coefficient"]
        let nameTextField = app.textFields["Name"]

        XCTAssertTrue(app.tables["Empty list"].exists)
        addButton.tap()
        addSubjectNavigationBar.buttons["Cancel"].tap()
        XCTAssertTrue(app.tables["Empty list"].exists)
        addButton.tap()
        saveButton.tap()
        textField.tap()
        textField.typeText("Sport")
        textField2.tap()
        textField2.typeText("1")
        saveButton.tap()
        XCTAssertFalse(app.tables["Empty list"].exists)
        XCTAssertTrue(sportNoNoteYetStaticText.exists)
        sportNoNoteYetStaticText.tap()
        sportNoNoteYetNavigationBar.children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        sportNoNoteYetStaticText.tap()
        sportNoNoteYetNavigationBar.buttons["Add"].tap()
        valueTextField.tap()
        valueTextField.typeText("15")
        coefficientTextField.tap()
        coefficientTextField.typeText("1")
        nameTextField.tap()
        nameTextField.typeText("Test Mark 1")
        app.navigationBars["New Mark"].buttons["Save"].tap()
        
    }
    
}
