 //
//  BackTableVC.swift
//  TownHunt
//
//  Created by iD Student on 7/29/16.
//  Copyright © 2016 LeeTech. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController{
    
    var tableArray: [String] = ["Main Map", "Add Map Packs", "Dev Screen"]
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
}