//
//  ViewController.swift
//  MoodRing
//
//  Created by Brian Davis on 12/25/17.
//  Copyright © 2017 Brian Davis. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let isAuthorized = requestAuthorizationToShare()
        if (!isAuthorized)
        {
            let alert = UIAlertController(title:"Alert",
                message: "Unauthorized!",
                preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default
                , handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    print("cancel")
                case .destructive:
                    print("destructive")
                }
            }))
        }
        // Do any additional setup after loading the view, typically from a nib.
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
        let heartRateQuantityType = NSSet(object: HKQuantityType
            .quantityType(forIdentifier:
                HKQuantityTypeIdentifier.heartRate))
        var isAuthorized = false
        healthStore?.requestAuthorization(toShare: nil, read:
        (heartRateQuantityType as! Set<HKObjectType>)) {
            (success, error) -> Void in
            isAuthorized = success
        }
        return isAuthorized
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

