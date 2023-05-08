//
//  UIPerformanceTests.swift
//  UIPerformanceTests
//
import XCTest

class UIPerformanceTests: BaseTest {
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
}





