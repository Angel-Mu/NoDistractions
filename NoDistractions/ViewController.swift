//
//  ViewController.swift
//  NoDistractions
//
//  Created by Angel Malavar on 8/4/17.
//  Copyright © 2017 Angel Malavar. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let notifier = NotificationHelper()
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    @IBOutlet weak var timeLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        //        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        print(String(format:"%02i : %02i", minutes, seconds))
        return String(format:"%02i : %02i", minutes, seconds)
    }
    
    
    func updateTimer() {
        seconds -= 1
        self.timeLabel.stringValue = timeString(time: TimeInterval(seconds))
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func showEndTime() {
        let cur = Date()
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 25, to: cur)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy hh:mm:ss"
        let result = formatter.string(from: date!)
        self.timeLabel.stringValue = result
    }
    
    @IBAction func startPomodoro(_ sender: NSButton) {
        //        25 minutes since not editable by now
        seconds = 1500
        notifier.scheduleTask()
        showEndTime()
    }

}

