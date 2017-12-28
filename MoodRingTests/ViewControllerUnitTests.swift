//
//  MoodRingTests.swift
//  MoodRingTests
//
//  Created by Brian Davis on 12/25/17.
//  Copyright © 2017 Brian Davis. All rights reserved.
//

import XCTest
@testable import MoodRing

class ViewControllerUnitTests: XCTestCase {
    
    var viewController : ViewController!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main"
            , bundle: Bundle.main)
        viewController = storyBoard
            .instantiateViewController(withIdentifier: "ViewController")
            as! ViewController
        let _ = viewController.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerSetup() {
        XCTAssertTrue(true)
    }
    
}
