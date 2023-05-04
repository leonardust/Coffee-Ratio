//
//  CoffeeMakerScreen.swift
//  RatiosUITests
//
//  Created by Lukasz Komorowski on 27/04/2023.
//  Copyright © 2023 John Peden. All rights reserved.
//

import Foundation
import XCTest

class CoffeeMakerScreen {
    
    let app: XCUIApplication
    let coffeeAmountInput: XCUIElement
    let waterRatioInput: XCUIElement
    let startButton: XCUIElement
    let pauseButton: XCUIElement
    let resetButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        self.coffeeAmountInput = app.textFields.element(boundBy: 0)
        self.waterRatioInput = app.textFields.element(boundBy: 1)
        self.startButton = app.buttons["Start"]
        self.pauseButton = app.buttons["Pause"]
        self.resetButton = app.buttons["Reset"]
    }
    
    func calculateWaterAmount(coffeeAmount: String, waterAmount: String) {
        coffeeAmountInput.tap()
        coffeeAmountInput.doubleTap()
        coffeeAmountInput.typeText(coffeeAmount)
        waterRatioInput.tap()
        waterRatioInput.doubleTap()
        waterRatioInput.typeText(waterAmount)
    }
    
    func tapStartButton() {
        startButton.tap()
    }
    
    func tapPauseButton() {
        pauseButton.tap()
    }
    
    func tapResetButton() {
        resetButton.tap()
    }
}

    
