//
//  ViewController.swift
//  HermesLogger
//
//  Created by Michael Selsky on 11/30/2015.
//  Copyright (c) 2015 Michael Selsky. All rights reserved.
//

import UIKit
import HermesLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HermesLogs.enabled = true
        HermesLogs.test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

