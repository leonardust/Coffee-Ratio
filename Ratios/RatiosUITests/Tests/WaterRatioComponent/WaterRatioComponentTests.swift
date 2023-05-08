//
//  WaterRatioComponentTests.swift
//  WaterRatioComponentTests
//
import XCTest

class WaterRatioComponentTests: BaseTest {
    
    func testWaterRatioInput_WhenGivenWaterRatioInput_ShouldFillWithMaxValueIfUserInputExceedsMaxValue() {
        coffeeMakerScreen.waterRatioInput.tap()
        coffeeMakerScreen.waterRatioInput.typeText("11")
        XCTAssertFalse(app.isElementExists(forElementWithID: "11", type: .textField), "Should not show 11 water ratio input")
        XCTAssertTrue(app.isElementExists(forElementWithID: "9.9", type: .textField), "Should show 9.9 in water ratio input")
    }
    
    func testWaterRatioInput_WhenGivenWaterRatioInput_ShouldAcceptNumbersWithAtLeastOneDecimalPoint() {
        coffeeMakerScreen.waterRatioInput.tap()
        coffeeMakerScreen.waterRatioInput.typeText("1.11")
        XCTAssertFalse(app.isElementExists(forElementWithID: "1.11", type: .textField), "Should not show 1.11 in water ratio input")
        XCTAssertTrue(app.isElementExists(forElementWithID: "1.1", type: .textField), "Should show 1.1 in water ratio input")
    }
    
    func testWaterRatioInput_WhenGivenWaterRatio_FillsTextField() {
        coffeeMakerScreen.waterRatioInput.tap()
        coffeeMakerScreen.waterRatioInput.typeText(WaterCalculationTestData.waterRatiosData[0])
        XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.waterRatiosData[0], type: .textField), "Should show \(WaterCalculationTestData.waterRatiosData[0]) in water ratio input")
    }
    
}
