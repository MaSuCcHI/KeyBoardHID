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
    var timer = Timer()
    override init() {
        peripheral = CBPeripheralManager(delegate: nil, queue: nil)
        super.init()
        peripheral.delegate = self
    }
    
    func setup() {
        addHIDService()
//        addDeviceInfoService()
//        addBatteryService()
        
        let advertisementData = [CBAdvertisementDataServiceUUIDsKey: [Const.HIDService.Service.UUID,Const.BatteryService.Service.UUID,Const.DeviceInfomationService.Service.UUID],CBAdvertisementDataLocalNameKey: "testKeybard"] as [String : Any]
        peripheral.startAdvertising(advertisementData)
    }
    
    func addHIDService(){
        let hidservice = HIDServices()
        let  service = hidservice.getService()
        peripheral.add(service)
    }
    
    func addDeviceInfoService(){
        let  service = CBMutableService(type: CBUUID(string: Const.DeviceInfomationService.Service.UUID), primary: true)
        let characteristicUUID = CBUUID(string: Const.DeviceInfomationService.Characteristic.manufaturerName)
        let properties: CBCharacteristicProperties = [.notify, .read, .write]
        let permissions: CBAttributePermissions = [.readable, .writeable]
        let characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: properties,
                                                     value: nil, permissions: permissions)
        service.characteristics = [characteristic]
        
        peripheral.add(service)
    }
    
    func addBatteryService(){
        let  service = CBMutableService(type: CBUUID(string: Const.BatteryService.Service.UUID), primary: true)
        let characteristicUUID = CBUUID(string: Const.BatteryService.Characteristic.batteryLevel)
        let properties: CBCharacteristicProperties = [.notify, .read, .write]
        let permissions: CBAttributePermissions = [.readable, .writeable]
        let characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: properties,
                                                     value: nil, permissions: permissions)
        service.characteristics = [characteristic]
        
        peripheral.add(service)
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
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didOpen channel: CBL2CAPChannel?, error: Error?) {
        print(error)
        //HIDreportの書き込み処理を入れる
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        print(request)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        print(requests)
    }
    
}
