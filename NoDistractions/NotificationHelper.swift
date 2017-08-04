//
//  NotificationHelper.swift
//  NoDistractions
//
//  Created by Angel Malavar on 8/4/17.
//  Copyright © 2017 Angel Malavar. All rights reserved.
//

import Foundation

class NotificationHelper {
    var timerNotification = Timer()
    var timerToggle = Timer()
    
    @objc func toggleDNDMode() {
        let task = Process()
        task.launchPath =  "/usr/bin/osascript"
        task.arguments = ["/Users/Angel/dnd.applescript"]
        task.launch()
    }
    
    @objc func showNotification() {
        let notification = NSUserNotification()
        
        notification.title = "Pomodoro is over!"
        notification.subtitle = "Let's take a 5 minute break"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
    
    func scheduleTask() {
        toggleDNDMode()
        self.timerToggle = Timer.scheduledTimer(timeInterval:   1485.0, target: self, selector: #selector(NotificationHelper.toggleDNDMode), userInfo: nil, repeats: false)
        
        self.timerNotification = Timer.scheduledTimer(timeInterval: 1500.0, target: self, selector: #selector(NotificationHelper.showNotification), userInfo: nil, repeats: false)
    }
}
