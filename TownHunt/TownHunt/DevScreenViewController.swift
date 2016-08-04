//
//  DevScreenViewController.swift
//  TownHunt
//
//  Created by iD Student on 8/2/16.
//  Copyright © 2016 LeeTech. All rights reserved.
//

import UIKit
import MapKit

class DevScreenViewController: UIViewController {

    @IBOutlet weak var menuOpenNavBarButton: UIBarButtonItem!
    
    let filePath = NSHomeDirectory() + "/Documents/" + "MITPack.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuOpenNavBarButton.target = self.revealViewController()
        menuOpenNavBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteFile(sender: AnyObject) {
        let text = ""
        do{
            try text.writeToFile(filePath, atomically: false, encoding: NSUTF8StringEncoding)
        }catch{
            
        }
    }

    @IBAction func addMITSamplePins(sender: AnyObject) {
        for pin in packPins{
            let writeLine = "\(pin.title!),\(pin.hint),\(pin.codeword),\(pin.coordinate.latitude),\(pin.coordinate.longitude),\(pin.pointVal)"
            writeToFile(writeLine)
        }
    }

    func writeToFile(content: String) {
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
    
    @IBAction func printsWhatsInFile(sender: AnyObject) {
        var stringFromFile: String
        do{
            stringFromFile = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding) as String
            let packPinLocArrays = stringFromFile.characters.split("\n").map(String.init)
            print(packPinLocArrays)
            if packPinLocArrays.isEmpty == false{
                for pinArray in packPinLocArrays{
                    print(pinArray)
                    let pinDetails = pinArray.characters.split(",").map(String.init)
                }
            }
        } catch let error as NSError{
            print(error.description)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
