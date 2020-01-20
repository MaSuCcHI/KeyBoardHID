//
//  ViewController.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/16.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController {
    var cbManager:BTManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cbManager = BTManager()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

