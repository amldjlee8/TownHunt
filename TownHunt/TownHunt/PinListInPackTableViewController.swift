//
//  PinListInPackTableViewController.swift
//  TownHunt
//
//  Created by iD Student on 8/3/16.
//  Copyright © 2016 LeeTech. All rights reserved.
//

import UIKit

class PinListInPackTableViewController: UITableViewController {
    
    var listOfPins: [PinLocation]! = []
    var filePath = ""
    
    @IBAction func cancelButtonNav(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButtonNav(sender: AnyObject) {
        clearFile()
        for pin in listOfPins{
            let writeLine = "\(pin.title!),\(pin.hint),\(pin.codeword),\(pin.coordinate.latitude),\(pin.coordinate.longitude),\(pin.pointVal)"
            savePackToFile(writeLine)
        }
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfPins.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> PinCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PinCell", forIndexPath: indexPath) as! PinCell
       
        let pin = listOfPins[indexPath.row]
        cell.titleLabel.text = pin.title
        cell.hintLabel.text = pin.hint
        cell.codewordLabel.text = "Answer: \(pin.codeword)"
        cell.pointValLabel.text = "(\(String(pin.pointVal)) Points)"
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            listOfPins.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func clearFile(){
        let text = ""
        do{
            try text.writeToFile(filePath, atomically: false, encoding: NSUTF8StringEncoding)
        }catch{
            print("Unable to clear file")
        }
    }
    
    func savePackToFile(content: String) {
        let contentToAppend = content+"\n"
        //Check if file exists
        if let fileHandle = NSFileHandle(forWritingAtPath: filePath) {
            //Append to file
            fileHandle.seekToEndOfFile()
            fileHandle.writeData(contentToAppend.dataUsingEncoding(NSUTF8StringEncoding)!)
        } else {
            //Create new file
            do {
                try contentToAppend.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
            } catch {
                print("Error creating \(filePath)")
            }
        }
    }
    
}
