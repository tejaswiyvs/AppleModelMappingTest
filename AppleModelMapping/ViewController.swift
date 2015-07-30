//
//  ViewController.swift
//  AppleModelMapping
//
//  Created by Tejaswi Yerukalapudi on 7/29/15.
//  Copyright © 2015 MCH. All rights reserved.
//

import UIKit
import OCMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("response", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        var dictionary: NSDictionary
        do {
            dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
            let array = dictionary["value"]
            let encounters = ObjectMapper.sharedInstance().objectFromSource(array, toInstanceOfClass: Encounter.self) as! [Encounter]
            print(encounters)
        }
        catch {
        
        }
    }
}

