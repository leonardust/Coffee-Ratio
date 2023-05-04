//
//  TestBase.swift
//  RatiosUITests
//
//  Created by Lukasz Komorowski on 28/04/2023.
//  Copyright © 2023 John Peden. All rights reserved.
//

import Foundation

class TestBase {
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

