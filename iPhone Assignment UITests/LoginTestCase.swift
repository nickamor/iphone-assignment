//
//  LoginTestCase.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 10/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import XCTest

class LoginTestCase: XCTestCase {
        
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
    
    func wait(_ evaluatedWithObject: AnyObject) {
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: evaluatedWithObject, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLogin() {
        // FIXME: can't get keyboard input to record
    }
    
    func testSignUp() {
        
        let app = XCUIApplication()
        wait(app.buttons["New user"])
        app.buttons["New user"].tap()
        
        wait(app.buttons["Sign Up"])
        app.buttons["Sign Up"].tap()
        
    }
    
    func testNewPost() {
        
        let app = XCUIApplication()
        
        testSignUp()
        
        let toolbarsQuery = app.toolbars
        
        wait(toolbarsQuery.buttons["Add"])
        toolbarsQuery.buttons["Add"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        element.children(matching: .textView).element.tap()
        app.otherElements["Hey"].tap()
        app.otherElements["hey"].tap()
        app.otherElements["it's"].tap()
        element.children(matching: .textView).element
        app.otherElements["Saturday"].tap()
        toolbarsQuery.buttons["Post"].tap()
        
    }
    
    func testFindUser() {
        
        let app = XCUIApplication()
        
        testSignUp()
        
        wait(app.tabBars.buttons["Following"])
        app.tabBars.buttons["Following"].tap()
        
        let toolbarsQuery = app.toolbars
        
        wait(toolbarsQuery.buttons["Search"])
        toolbarsQuery.buttons["Search"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .textField).element.tap()
        

        app.tables.staticTexts["bob"].tap()
        
        wait(toolbarsQuery.buttons["Back"])
        toolbarsQuery.buttons["Back"].tap()
        toolbarsQuery.buttons["Cancel"].tap()
        
    }
    
    func testLogOut() {
        
        let app = XCUIApplication()
        
        testSignUp()
        
        wait(app.tabBars.buttons["Me"])
        app.tabBars.buttons["Me"].tap()
        
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.children(matching: .textView).element.tap()
        wait(elementsQuery.buttons["Log Out"])
        elementsQuery.buttons["Log Out"].tap()
        
    }
    
}
