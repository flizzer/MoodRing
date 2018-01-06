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

    var mostRecentHeartRate = ""
    let healthStore = HKHealthStore()
    
    @IBOutlet var moodLabel: WKInterfaceLabel!
    
    @IBAction func moodButtonPressed() {
        getCurrentHeartRateAndDisplay()
    }
    
    func getCurrentHeartRateAndDisplay()
    {
        getMostRecentHeartRateSample() { (mostRecentHeartRateSample,
            error) in
            guard let mostRecentHeartRateSample =
                mostRecentHeartRateSample else {
                if let error = error {
                    print(error)
                }
                return
            }
            self.mostRecentHeartRate = "\(String(describing: Int(mostRecentHeartRateSample.quantity.doubleValue(for: HKUnit.init(from: "count/min")))))  BPM"
            self.updateMoodLabel()
        }
    }
    
    func getMostRecentHeartRateSample(completion: @escaping (
        HKQuantitySample?, Error?) -> Void)
    {
        let heartRateQuantityType = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.heartRate)
        let mostRecentResultPredicate = HKQuery
            .predicateForSamples(
                withStart: Date.distantPast
                , end: Date()
                , options: .strictEndDate)
        let sortDescriptors = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate, ascending: false)
        let mostRecentHeartRateQuery = HKSampleQuery(
            sampleType: heartRateQuantityType!,
            predicate: mostRecentResultPredicate,
            limit: 1,
            sortDescriptors: [sortDescriptors])
        { (query, results, error) in
            
            DispatchQueue.main.async {
                
                guard let mostRecentResult = results!.first
                    as? HKQuantitySample else {
                    completion(nil, error)
                    return
                }
                completion(mostRecentResult , nil)
            }
        }
        healthStore.execute(mostRecentHeartRateQuery)
    }
    
    func updateMoodLabel()
    {
        moodLabel.setText(mostRecentHeartRate);
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        moodLabel.setText("")
        
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
