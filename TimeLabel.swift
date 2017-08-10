//
//  TimeLabel.swift
//  quitting time
//
//  Created by sudo on 4/21/17.
//  Copyright © 2017 sudo. All rights reserved.
//

import UIKit
import Foundation



extension DateFormatter {
    convenience init(timeStyle: DateFormatter.Style) {
        self.init()
        self.timeStyle = timeStyle
    }
}

extension Date {
    static let shortTime = DateFormatter(timeStyle: .short)
    static let mediumTime = DateFormatter(timeStyle: .medium)
    
    var shortTime: String { return Date.shortTime.string(from: self) }
    var mediumTime: String { return Date.mediumTime.string(from: self) }
    var calendar: Calendar { return Calendar.autoupdatingCurrent }
    var hour:   Int { return calendar.dateComponents([.hour],   from: self).hour   ?? 0 }
    var minute: Int { return calendar.dateComponents([.minute], from: self).minute ?? 0 }
    var second: Int { return calendar.dateComponents([.second], from: self).second ?? 0 }
}


class TimeLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.textColor = UIColor.blue
    }
    
    
    var timer: Timer!
    var displaySeconds: Bool = false {
        didSet {
            if timer != nil {
                timer.invalidate()
                timer = nil
            }
            setTimer()
        }
    }
    let calendar = Calendar.autoupdatingCurrent
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        font = UIFont.monospacedDigitSystemFont(ofSize: 40, weight: UIFontWeightRegular)
        textColor = UIColor(red: 123/255, green: 123/255, blue: 124/255, alpha: 1)
        minimumScaleFactor = 0.1
        baselineAdjustment = .alignCenters
        UIApplication.shared.isIdleTimerDisabled = true
        displaySeconds = true
        updateText()
        if timer == nil {
            setTimer()
        }
    }
    func setTimer() {
        let now = Date()
        let date = calendar.date(bySettingHour: now.hour,
                                 minute: displaySeconds ? now.minute : now.minute + 1,
                                 second: displaySeconds ? now.second + 1 : 0 ,
                                 of: now) ?? Date()
        timer = Timer(fireAt: date, interval: displaySeconds ? 1 : 60, target: self, selector: #selector(updateText), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    func updateText() {
        print(Date().mediumTime)
        text = displaySeconds ? Date().mediumTime : Date().shortTime
    }
    
    
}
