//
//  RatiosUITests.swift
//  RatiosUITests
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import XCTest

class RatiosUITests: XCTestCase {
    
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
    
    func testCoffeeInput_WhenGivenCoffeeAmount_FillsTextField() {
        coffeeMakerScreen.coffeeAmountInput.tap()
        coffeeMakerScreen.coffeeAmountInput.typeText(WaterCalculationTestData.coffeeAmountsData[0])
        XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.coffeeAmountsData[0], type: .textField), "Should show \(WaterCalculationTestData.coffeeAmountsData[0]) in coffee amount input")
    }
    
    func testWaterRatioInput_WhenGivenWaterRatio_FillsTextField() {
        coffeeMakerScreen.waterRatioInput.tap()
        coffeeMakerScreen.waterRatioInput.typeText(WaterCalculationTestData.waterRatiosData[0])
        XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.waterRatiosData[0], type: .textField), "Should show \(WaterCalculationTestData.waterRatiosData[0]) in water ratio input")
    }

    func testWaterAmountCalculation_WhenInsertCoffeeAmountAndWaterRatio_ShouldCalculateWaterAmountAsMultiplicationOfCoffeeAmountAndWaterRatio() {
        for i in 0..<WaterCalculationTestData.coffeeAmountsData.count {
            coffeeMakerScreen.calculateWaterAmount(coffeeAmount: WaterCalculationTestData.coffeeAmountsData[i], waterAmount: WaterCalculationTestData.waterRatiosData[i])
            XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.waterAmountsData[i], type: .staticText), "Should show \(WaterCalculationTestData.waterAmountsData[i]) water amount based on multiplication of coffee amount and water ratio")
        }
    }
    
    func testTimerButtons_WhenTapped_ShouldStartPauseAndResetTimer() {
        coffeeMakerScreen.tapStartButton()
        XCTAssertTrue(app.waitForElementExistence(forElementWithID: "Pause", type: .button, timeout: 1), "Should show that Start button toggles to Pause after tapping")
        coffeeMakerScreen.tapPauseButton()
        XCTAssertTrue(app.isElementExists(forElementWithID: "Start", type: .button), "Should show that Pause button toggles to Start after tapping")
        XCTAssertTrue(app.isElementExists(forElementWithID: "00:01", type: .staticText), "Should show correct time after tapping Pause button")
        app.swipeUp()
        coffeeMakerScreen.tapResetButton()
        XCTAssertTrue(app.isElementExists(forElementWithID: "00:00", type: .staticText), "Should show correct time after tapping Reset button")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
}




