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
    var appointmentSearchResults: Array<AppointmentSearchResult>?

    override func viewDidLoad() {
        super.viewDidLoad()
//        let path = NSBundle.mainBundle().pathForResource("response", ofType: "json")
//        let data = NSData(contentsOfFile: path!)
//        var dictionary: NSDictionary
//        do {
//            dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
//            let array = dictionary["value"]
//            let loggingProvider = CommonLoggingProvider(logLevel: LogLevelInfo)
//            ObjectMapper.sharedInstance().loggingProvider = loggingProvider
//            let mappingProvider = InCodeMappingProvider()
//            mappingProvider.mapFromDictionaryKey("DoctorSpecialties", toPropertyKey: "specialty", withObjectType: Specialty.self, forClass: Doctor.self)
//            ObjectMapper.sharedInstance().mappingProvider = mappingProvider
//            self.encounters = ObjectMapper.sharedInstance().objectFromSource(array, toInstanceOfClass: Encounter.self) as? [Encounter]
//        }
//        catch {
//        
//        }
        
        let path = NSBundle.mainBundle().pathForResource("response2", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        var array: NSArray
        do {
            array = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSArray
            let loggingProvider = CommonLoggingProvider(logLevel: LogLevelInfo)
            ObjectMapper.sharedInstance().loggingProvider = loggingProvider
            let mappingProvider = InCodeMappingProvider()
            mappingProvider.mapFromDictionaryKey("DoctorAvailability", toPropertyKey: "DoctorAvailability", withObjectType: Availability.self, forClass: AppointmentSearchResult.self)
            ObjectMapper.sharedInstance().mappingProvider = mappingProvider
            self.appointmentSearchResults = ObjectMapper.sharedInstance().objectFromSource(array, toInstanceOfClass: AppointmentSearchResult.self) as? [AppointmentSearchResult]
            self.tableView?.reloadData()
        }
        catch {

        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appointmentSearchResults == nil) ? 0 : appointmentSearchResults!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableViewCell = tableView.dequeueReusableCellWithIdentifier("reuseId")
        if tableViewCell == nil {
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseId")
        }
        let model: AppointmentSearchResult = self.appointmentSearchResults![indexPath.row]
        tableViewCell?.textLabel?.text = String(model.FirstName)
        tableViewCell?.detailTextLabel?.text = String(model.LastName)
        return tableViewCell!
    }
}