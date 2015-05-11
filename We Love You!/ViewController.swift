//
//  ViewController.swift
//  We Love You!
//
//  Created by Ryan Arana on 5/10/15.
//  Copyright (c) 2015 aranasaurus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    @IBAction func configButtonTapped() {
        var alertController = UIAlertController(title: "Sorry, Honey", message: "I haven't implemented this yet.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "That's OK, I still love you.", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

