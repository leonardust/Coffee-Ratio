//
//  CoffeeInputComponentTests.swift
//  CoffeeInputComponentTests
//
import XCTest

class CoffeeInputComponentTests: BaseTest {
    
    func testCoffeInput_WhenGivenCoffeeAmount_ShouldAcceptValuesWithFiveCharactersLong() {
        coffeeMakerScreen.coffeeAmountInput.tap()
        coffeeMakerScreen.coffeeAmountInput.typeText("101010")
        XCTAssertFalse(app.isElementExists(forElementWithID: "101010", type: .textField), "Should not show 101010 in coffee amount data")
        XCTAssertTrue(app.isElementExists(forElementWithID: "10101", type: .textField), "Should show 10101 in coffee amount data")
    }
    
    func testCoffeeInput_WhenGivenCoffeeAmount_FillsTextField() {
        coffeeMakerScreen.coffeeAmountInput.tap()
        coffeeMakerScreen.coffeeAmountInput.typeText(WaterCalculationTestData.coffeeAmountsData[0])
        XCTAssertTrue(app.isElementExists(forElementWithID: WaterCalculationTestData.coffeeAmountsData[0], type: .textField), "Should show \(WaterCalculationTestData.coffeeAmountsData[0]) in coffee amount input")
    }
    
}
