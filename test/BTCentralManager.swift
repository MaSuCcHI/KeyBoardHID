//
//  BTCentralManager.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/19.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTcentralManager:NSObject, CBCentralManagerDelegate {
    let central: CBCentralManager!
    override init() {
        central = CBCentralManager(delegate: nil, queue: nil)
        super.init()
        central.delegate = self
    }
    
    func setup() {
            central.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print(central)
        switch central.state {
        case .poweredOn:
            setup()
        default:
            print(central.state)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(advertisementData)
    }
    
}
