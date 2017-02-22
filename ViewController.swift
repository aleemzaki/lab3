//
//  ViewController.swift
//  Stopwatch
//
//  Created by Aleem on 2/16/17.
//  Copyright © 2017 Aleem. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var double1 = 0
    var double2 = 0
    var double3 = 0
    
    var timeString = String()//(format: "%02d:%02d.%d", double1, double2, double3)
    var timerDisplayer2 = String()
    
    
    
    var date = Date()
    var now = Date()
    var timeElasped = Double()
    var sec = Int()
    var min = Int()
    var mil = Double()
    var milInInt = Int()
    
    var myTimer = Timer()
    
    var bang = Date()
    
    @IBOutlet weak var timerDisplayer: UILabel!
    
    
    
    @IBAction func startPressed(_ sender: Any) {
        date = Date()
        self.setup()
        //date = Date()
        //startTimer(myTimer)
        //date.init()
        
    }
    
    func setup(){
        myTimer = Timer.scheduledTimer(timeInterval:0.1, target: self,
                                       selector: #selector (timerBegin),
                                       userInfo: nil,
                                       repeats: true)
        
        
    }
    func timerBegin() {
        //let now = Date()
        let difference = date.timeIntervalSinceNow
        
        
        // Format the difference for display
        // For example, minutes & seconds
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.string(from: difference)
        print(difference)
        timeElasped = (-1)*difference
        min = Int((timeElasped/60).rounded(.towardZero))
        sec = Int(timeElasped.rounded(.towardZero))-(min*60)
        mil = timeElasped - Double(sec) - Double(min*60)
        milInInt = Int(mil*10)
        timeString = String(format: "%02d:%02d", min, sec)
        
        
        timerDisplayer.text = timeString+"."+String(milInInt)
        //timeString
        //timeString
        /*
         var timeString = String(format: "%02d:%02d.%d", double1, double2, double3)
         
         
         //bang = Date()
         timeElasped = date.timeIntervalSinceNow
         
         min = Int((timeElasped/60).rounded(.towardZero))
         sec = Int(timeElasped.rounded(.towardZero))-(min*60)
         mil = timeElasped - Double(sec) + Double(min*60)
         timeString = "\(min),\(sec),\(mil)"
         
         //let dateComponentsFormatter = DateComponentsFormatter()
         //dateComponentsFormatter.string(from: timeElasped)
         //timeString = stopTimer(myTimer)
         timerDisplayer.text = timeString
         timeString
         // return bang.description
         */
        //return "er"
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        timerDisplayer.text = timeString+"."+String(milInInt)
        myTimer.invalidate()
        /*This returns a TimeInterval object representing the time passed in the format of a double. The format of the double is (seconds).(milliseconds) so 42.5 would mean 42 seconds and half a millisecond
        now = Date()
        
        timeElasped = now.timeIntervalSinceNow
        //sec =
        min = Int((timeElasped/60).rounded(.towardZero))
        sec = Int(timeElasped.rounded(.towardZero))-(min*60)
        mil = timeElasped - Double(sec) + Double(min*60)
        timeString = "\(4),\(4),\(4)"
        */
        //let dateComponentsFormatter = DateComponentsFormatter()
        //dateComponentsFormatter.string(from: timeElasped)
        //timeString = stopTimer(myTimer)
 
       
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

