//
//  InterfaceController.swift
//  MoodRing WatchKit Extension
//
//  Created by Brian Davis on 12/25/17.
//  Copyright © 2017 Brian Davis. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit


class InterfaceController: WKInterfaceController {

    var externalBodyTemperature = 0;
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    
    @IBAction func moodButtonPressed() {
        
        //todo:  what's the correct way to check for permission granted and then request if necessary -- bhd
        //requestPermission()
        
//        if (!isHealthDataAvailable())
//        {
//
//        }
        externalBodyTemperature = getExternalBodyTemperature();
        updateMoodLabel();
    }
    
    func getExternalBodyTemperature() -> Int
    {
        return 0;
    }
    
    func updateMoodLabel()
    {
        moodLabel.setText("\(externalBodyTemperature)");
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
