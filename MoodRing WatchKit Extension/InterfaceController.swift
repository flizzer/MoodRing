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

    var currentHeartRate = ""
    //var currentHeartRateResults = HKSampleType
    let healthStore = HKHealthStore()
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    
    @IBAction func moodButtonPressed() {
        getCurrentHeartRate()
        updateMoodLabel();
    }
    
    func getCurrentHeartRate()
    {
        let currentHeartRateQuery = buildCurrentHeartRateQuery()
        healthStore.execute(currentHeartRateQuery)
    }
    
    func buildCurrentHeartRateQuery() -> HKSampleQuery
    {
        let heartRateQuantityType = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.heartRate)
        return HKSampleQuery(sampleType: heartRateQuantityType!,
                             predicate: nil,
                             limit: 1,
                             sortDescriptors: nil)
        { [unowned self] (query, results, error) in
            guard let mostRecentResult = results!.first as? HKQuantitySample else {
                return
            }
                //if let result = results.first as? [HKQuantitySample] {
                //self.currentHeartRateResults = results
                self.currentHeartRate =
            "\(String(describing: Int(mostRecentResult.quantity.doubleValue(for: HKUnit.init(from: "count/min")))))  BPM"
            
            
            }
    }
    
    func updateMoodLabel()
    {
        moodLabel.setText(currentHeartRate);
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
