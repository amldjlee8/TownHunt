//
//  sound.swift
//  TownHunt
//
//  Created by iD Student on 8/3/16.
//  Copyright © 2016 LeeTech. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

var audioPlayer = AVAudioPlayer()

class Sound{
    func playSound(soundName: String){
        let sounds = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType: "mp3")!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: sounds)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch{
            print("Error getting the audio file")
    
        }
    }
}