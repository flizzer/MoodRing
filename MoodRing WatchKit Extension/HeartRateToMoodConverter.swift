//
//  HeartRateToMoodConverter.swift
//  MoodRing WatchKit Extension
//
//  Created by Brian Davis on 1/6/18.
//  Copyright © 2018 Brian Davis. All rights reserved.
//

import Foundation
import UIKit

class HeartRateToMoodConverter {
    
    var mood = Mood()
    //var heartRate = 0
    
    func convert(_ heartRate: Int) -> Mood {
        switch heartRate {
            case 51...60:
                mood = Mood(description: "Happy", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
            case 61...70:
                mood = Mood(description: "Romantic", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
            case 71...80:
                mood = Mood(description: "Lovable", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
            case 81...90:
                mood = Mood(description: "Relaxed", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            case 91...100:
                mood = Mood(description: "Active", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            case 101...110:
                mood = Mood(description: "Unsettled", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
            case 111...120:
                mood = Mood(description: "Nervous", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
            case 121...130:
                mood = Mood(description: "Unsettled", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            default:
                mood = Mood(description: "Check Your Pulse!!!", color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        }
        return mood
    }
    
}
