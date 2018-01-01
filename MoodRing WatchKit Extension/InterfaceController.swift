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
    let healthStore = HKHealthStore()
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    
    @IBAction func moodButtonPressed() {
        getExternalBodyTemperature()
        updateMoodLabel();
    }
    
    func getExternalBodyTemperature()
    {
        let bodyTemperatureQuery = buildBodyTemperatureQuery()
        healthStore.execute(bodyTemperatureQuery)
    }
    
    func buildBodyTemperatureQuery() -> HKSampleQuery
    {
        let bodyTemperature = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.bodyTemperature)
        return HKSampleQuery(sampleType: bodyTemperature!,
                             predicate: nil,
                             limit: 1,
                             sortDescriptors: nil)
        { [unowned self] (query, results, error) in
            if let results = results as? [HKQuantitySample] {
                self.externalBodyTemperature = "\(results[0].quantity)"
            }
            
        }
    }
    
    func updateMoodLabel()
    {
        moodLabel.setText(externalBodyTemperature);
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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
