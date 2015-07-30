//
//  ViewController.swift
//  AppleModelMapping
//
//  Created by Tejaswi Yerukalapudi on 7/29/15.
//  Copyright © 2015 MCH. All rights reserved.
//

import UIKit
import OCMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    var encounters: Array<Encounter>?

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("response", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        var dictionary: NSDictionary
        do {
            dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
            let array = dictionary["value"]
            self.encounters = ObjectMapper.sharedInstance().objectFromSource(array, toInstanceOfClass: Encounter.self) as? [Encounter]
        }
        catch {
        
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (encounters == nil) ? 0 : encounters!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableViewCell = tableView.dequeueReusableCellWithIdentifier("reuseId")
        if tableViewCell == nil {
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseId")
        }
        let model: Encounter = self.encounters![indexPath.row]
        tableViewCell?.textLabel?.text = model.person?.FirstName
        return tableViewCell!
    }
}

