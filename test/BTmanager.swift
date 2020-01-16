//
//  BTmanager.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/16.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTManager: NSObject, CBPeripheralManagerDelegate {
    let peripheral: CBPeripheralManager!
    override init() {
        peripheral = CBPeripheralManager(delegate: nil, queue: nil)
        super.init()
        peripheral.delegate = self
    }
    
    func setup() {
        let  service = CBMutableService(type: CBUUID(string: Const.HIDService.Service.UUID), primary: true)
        let characteristicUUID = CBUUID(string: Const.HIDService.Characteristic.bootKeyboardInputReport)
        let properties: CBCharacteristicProperties = [.notify, .read, .write]
        let permissions: CBAttributePermissions = [.readable, .writeable]
        let characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: properties,
                                                     value: nil, permissions: permissions)
        service.characteristics = [characteristic]
        
        peripheral.add(service)
        
        let advertisementData = [CBAdvertisementDataServiceUUIDsKey: [service.uuid],CBAdvertisementDataLocalNameKey: "testKeybard"] as [String : Any]
        peripheral.startAdvertising(advertisementData)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            setup()
        default:
            print(peripheral.state)
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if error != nil {
            print(error)
            return
        }
        print("OK")
    }
}
