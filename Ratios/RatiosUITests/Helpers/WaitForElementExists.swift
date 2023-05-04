//
//  WaitForElement.swift
//  RatiosUITests
//
//  Created by Lukasz Komorowski on 28/04/2023.
//  Copyright © 2023 John Peden. All rights reserved.
//

import Foundation
import XCTest

enum ElementType {
    case staticText
    case button
    case textField
}

extension XCUIElement {
    
    func isElementExists(forElementWithID elementID: String, type: ElementType) -> Bool {
        switch type {
        case .staticText:
            let element = self.staticTexts[elementID]
            return element.exists
        case .button:
            let element = self.buttons[elementID]
            return element.exists
        case .textField:
            let element = self.textFields[elementID]
            return element.exists
        default:
            fatalError("Unknown element type: \(type)")
        }
    }
    
    func waitForElementExistence(forElementWithID elementID: String, type: ElementType, timeout: TimeInterval) -> Bool {
        switch type {
        case .staticText:
            let element = self.staticTexts[elementID]
            return element.waitForExistence(timeout: timeout)
        case .button:
            let element = self.buttons[elementID]
            return element.waitForExistence(timeout: timeout)
        case .textField:
            let element = self.textFields[elementID]
            return element.waitForExistence(timeout: timeout)
        default:
            fatalError("Unknown element type: \(type)")
        }
    }
}
