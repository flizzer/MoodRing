//
//  Mood.swift
//  MoodRing WatchKit Extension
//
//  Created by Brian Davis on 1/6/18.
//  Copyright © 2018 Brian Davis. All rights reserved.
//

import Foundation
import UIKit

struct Mood {
    var description = ""
    var color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    init(description: String, color: UIColor) {
        self.description = description
        self.color = color
    }
    
    init() {
        
    }
}
