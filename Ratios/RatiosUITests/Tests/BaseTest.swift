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

    enum ElementType {
        case staticText
        case button
    }

    func waitForElement(forElementWithID elementID: String, type: ElementType, timeout: TimeInterval) -> Bool {
        switch type {
        case .staticText:
            let element = XCUIApplication().staticTexts[elementID]
            return element.waitForExistence(timeout: timeout)
        case .button:
            let element = XCUIApplication().buttons[elementID]
            return element.waitForExistence(timeout: timeout)
        default:
            fatalError("Unknown element type: \(type)")
        }
    }
    
}
