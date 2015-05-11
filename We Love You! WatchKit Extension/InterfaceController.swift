//
//  InterfaceController.swift
//  We Love You! WatchKit Extension
//
//  Created by Ryan Arana on 5/10/15.
//  Copyright (c) 2015 aranasaurus. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var label: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func labelTapped() {
        updateMessage(LoveMessage())
    }
    @IBAction func imageTapped() {
        updateMessage(LoveMessage())
    }

    func updateMessage(l: LoveMessage) {
        image.setImageNamed(l.imageName)
        label.setText(l.message)
    }

    override func handleUserActivity(userInfo: [NSObject : AnyObject]?) {
        if let d = userInfo as? [String: AnyObject],
            msg = d["message"] as? String,
            imageName = d["imageName"] as? String
        {
            updateMessage(LoveMessage(message: msg, imageName: imageName))
        }
    }
}
