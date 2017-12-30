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

    var externalBodyTemperature = "0"
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    
    @IBAction func moodButtonPressed() {
        updateMoodLabel();
    }
    
    func getExternalBodyTemperature() -> Int
    {
        return 0;
    }
    
    func updateMoodLabel()
    {
        moodLabel.setText(externalBodyTemperature);
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let isAuthorized = requestAuthorizationToShare()
        if (!isAuthorized)
        {
            moodLabel.setText("Not Authorized");
        }
        
        // Configure interface objects here.
    }
    
    func requestAuthorizationToShare() -> Bool {
        let healthStore: HKHealthStore? = {
            if HKHealthStore.isHealthDataAvailable() {
                return HKHealthStore()
            }
            else {
                return nil
            }
        }()
        let bodyTemperature = NSSet(object: HKQuantityType
            .quantityType(forIdentifier:
            HKQuantityTypeIdentifier.bodyTemperature))
        var isAuthorized = false
        healthStore?.requestAuthorization(toShare: nil, read:
            (bodyTemperature as! Set<HKObjectType>)) {
                (success, error) -> Void in
                isAuthorized = success
            }
        return isAuthorized
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
