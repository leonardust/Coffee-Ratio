//
//  WaterCalculationTests.swift
//  WaterCalculationTests
//
import XCTest

class WaterCalculationTests: BaseTest {
    
    func testWaterAmountCalculation_WhenInsertCoffeeAmountAndWaterRatio_ShouldCalculateWaterAmountAsMultiplicationOfCoffeeAmountAndWaterRatio() {
        for i in 0..<WaterCalculationTestData.coffeeAmountsData.count {
            coffeeMakerScreen.calculateWaterAmount(coffeeAmount: WaterCalculationTestData.coffeeAmountsData[i], waterAmount: WaterCalculationTestData.waterRatiosData[i])
            XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.waterAmountsData[i], type: .staticText), "Should show \(WaterCalculationTestData.waterAmountsData[i]) water amount based on multiplication of coffee amount and water ratio")
        }
    }
    
}





