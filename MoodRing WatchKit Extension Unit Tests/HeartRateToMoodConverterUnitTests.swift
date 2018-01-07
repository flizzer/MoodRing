//
//  HeartRateToMoodConverterUnitTests.swift
//  MoodRingTests
//
//  Created by Brian Davis on 1/6/18.
//  Copyright © 2018 Brian Davis. All rights reserved.
//

import Foundation
import UIKit

// FIX: figure out why can't reference class from another group -- bhd
class HeartRateToMoodConverterUnitTests {
    
    let heartRateToMoodConverter = HeartRateToMoodConverter()
    
    func testConvertToHappy() throws -> String {
        let expectedMoodDescription = "Happy"
        let expectedMoodColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        heartRateToMoodConverter.convert(51)
        let actualMoodDescription = heartRateToMoodConverter.mood.description
        let actualMoodColor = heartRateToMoodConverter.mood.color
        if (actualMoodDescription != "Happy") {
            throw HeartRateToMoodConverterUnitTestErrors
                .assertFailForMoodDescription(message:
                    "Description should be \(expectedMoodDescription) but was \(actualMoodDescription)")
        }
        if (actualMoodColor != expectedMoodColor) {
            throw HeartRateToMoodConverterUnitTestErrors
                .assertFailForMoodColor(message:
                    "Color should be \(expectedMoodColor) but was \(actualMoodColor)")
        }
        return ""
    }
}

enum HeartRateToMoodConverterUnitTestErrors : Error {
    case assertFailForMoodDescription(message: String)
    case assertFailForMoodColor(message: String)
}

