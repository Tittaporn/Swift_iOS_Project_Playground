//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by M3ts LLC on 6/23/22.
//

import XCTest

/*Source : https://www.youtube.com/watch?v=64EwwjWw1kc*/
class UnitTestExampleUITests: XCTestCase {
    // MARK: - Add Noise Maker UI Test
    func testAddNoiseMaker() {
        let app = XCUIApplication()
        app.launch()
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameFiled = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews.textFields["Shaggy"]
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Hey, Lee. You got this!"]
        newNameBtn.tap()
        nameFiled.tap()
        nameFiled.typeText("Hey, Lee. You got this!")
        XCTAssertFalse(addedCell.exists)
        addBtn.tap()
        XCTAssertTrue(addedCell.exists)
    }
    
    // MARK: - Delete Noise Maker UI Test
    func testDeleteNoiseMaker() {
        let app = XCUIApplication()
        app.launch()
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameFiled = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews.textFields["Shaggy"]
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Victor"]
        let tablesQuery = app.tables
        let deleteBtn = tablesQuery.buttons["Delete"]
        newNameBtn.tap()
        nameFiled.tap()
        nameFiled.typeText("Victor")
        addBtn.tap()
        addedCell.swipeLeft()
        deleteBtn.tap()
        XCTAssertFalse(addedCell.exists) // Victor Cell Does not Exist
    }
}
