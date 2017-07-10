//
//  ViewController.swift
//  TaskTimeRecorder
//
//  Created by Louis on 2017/7/10.
//  Copyright © 2017年 Louis's Mac. All rights reserved.
//

import UIKit

class TimeRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var RecordTimeTableView: UITableView!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var EditButton: UIButton!
    
    var recordTimeArray = [String]()
    var checkedTableIndex = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecordTimeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RecordButtonClicked(_ sender: Any) {
        let CurrentTime = getCurrentTimeString()
        recordTimeArray.append(CurrentTime)
        RecordTimeTableView.reloadData()
    }
    
    @IBAction func EditButtonClicked(_ sender: Any) {
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recordTimeArray.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = RecordTimeTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = recordTimeArray[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = cell?.accessoryType == UITableViewCellAccessoryType.checkmark ?
            UITableViewCellAccessoryType.none : UITableViewCellAccessoryType.checkmark
        if( cell?.accessoryType == UITableViewCellAccessoryType.checkmark ){
            checkedTableIndex.insert(indexPath)
        }
        else{
            checkedTableIndex.remove(indexPath)
        }
    }
    
    func getCurrentTimeString() -> String{
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        return today_string
    }



}

