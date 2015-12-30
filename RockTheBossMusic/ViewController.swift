//
//  ViewController.swift
//  RockTheBossMusic
//
//  Created by Bat Computer on 11/4/15.
//  Copyright © 2015 HardSoft. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var scrubSlider: UISlider!
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("21 Boss", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
        }
    }
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
        
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("21 Boss", ofType: "mp3")!))
            
        } catch {
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

