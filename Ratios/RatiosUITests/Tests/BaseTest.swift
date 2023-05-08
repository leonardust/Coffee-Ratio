//
//  BaseTest.swift
//  BaseTest
//
import XCTest

class BaseTest: XCTestCase {
    
    var app: XCUIApplication!
    var coffeeMakerScreen: CoffeeMakerScreen!

    override func setUp() {
        app = XCUIApplication()
        app.launch()
        coffeeMakerScreen = CoffeeMakerScreen(app: app)
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        app = nil
    }
    
}
