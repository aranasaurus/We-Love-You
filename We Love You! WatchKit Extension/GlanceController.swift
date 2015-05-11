//
//  GlanceController.swift
//  We Love You! WatchKit Extension
//
//  Created by Ryan Arana on 5/10/15.
//  Copyright (c) 2015 aranasaurus. All rights reserved.
//

import WatchKit
import Foundation




class GlanceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var label: WKInterfaceLabel!

    var previousUpdate = NSDate(timeIntervalSinceReferenceDate: 0)
    var loveMessage = LoveMessage()
    let updateInterval = NSTimeInterval(5)

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        if NSDate().timeIntervalSinceDate(previousUpdate) > updateInterval {
            loveMessage = LoveMessage()
            previousUpdate = NSDate()
        }

        image.setImageNamed(loveMessage.imageName)
        label.setText(loveMessage.message)

        var userInfo: [NSObject: AnyObject] = [
            "imageName": loveMessage.imageName,
            "message": loveMessage.message
        ]
        updateUserActivity("message", userInfo: userInfo, webpageURL: nil)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
