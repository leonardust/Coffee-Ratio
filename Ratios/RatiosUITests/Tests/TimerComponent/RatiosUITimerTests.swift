//
//  RatiosUITimerTests.swift
//  RatiosUITimerTests
//
import XCTest

class RatiosUITimerTests: BaseTest {
    
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
    
}




