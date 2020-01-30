//
//  BTmanager.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/16.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTManager: NSObject,CBPeripheralManagerDelegate {
    let peripheral: CBPeripheralManager!
    var hidService: CBMutableService!
    var timer = Timer()
    override init() {
        peripheral = CBPeripheralManager(delegate: nil, queue: nil)
        super.init()
        peripheral.delegate = self
    }
    
    func setup() {
        hidService = addHIDService()
        addDeviceInfoService()
//        addBatteryService()
        
        let uuidKeys = [CBUUID(string: "1812"),
                        CBUUID(string: "180A")]
        let advertisementData = [CBAdvertisementDataServiceUUIDsKey: uuidKeys,
                                 CBAdvertisementDataLocalNameKey: "testKeybard"] as [String : Any]
        peripheral.startAdvertising(advertisementData)
    }
    
    private func addHIDService() -> CBMutableService{
        let  service = HIDServices().getService()
        peripheral.add(service)
        return service
    }
    
    private func addDeviceInfoService(){
        let  service = DeviceInfomationServices().getService()
        peripheral.add(service)
    }
    
    func addBatteryService(){
        let  service = CBMutableService(type: CBUUID(string: Const.BatteryService.Service.UUID), primary: true)
        let characteristicUUID = CBUUID(string: Const.BatteryService.Characteristics.BatteryLevel.uuid)
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
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        print(error)
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if error != nil {
            print(error)
            return
        }
        print("OK")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        print(request)
            if request.characteristic.uuid.uuidString == Const.HIDService.Characteristics.Report.uuid {
                //§7.2.1[2] Get_report
            }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        print(requests)
        for request in requests {
            if request.characteristic.uuid.uuidString == Const.HIDService.Characteristics.Report.uuid {
                //§7.2.2[2] Set_report
            }
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        
        //input report の Notify開始リクエスト受信時
        if characteristic.uuid.uuidString == Const.HIDService.Characteristics.Report.uuid {
            //§4.4[2] Data Input を送信．
            
        }
        
        //こっちの方が後々いいかも
//        switch characteristic.uuid.uuidString {
//        case Const.HIDService.Characteristics.Report.uuid:
//            <#code#>
//        default:
//            <#code#>
//        }
    }
    
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.020,
                                             repeats: true, block: { (timer) in
//                                                peripheral.updateValue(<#T##value: Data##Data#>, for: , onSubscribedCentrals: <#T##[CBCentral]?#>)
                                            })
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didOpen channel: CBL2CAPChannel?, error: Error?) {
        print(error)
        guard let channel = channel else { return }
        
        channel.inputStream.delegate = self as StreamDelegate
        channel.outputStream.delegate = self as StreamDelegate
        
        channel.inputStream.schedule(in: RunLoop.current, forMode: .default)
        channel.outputStream.schedule(in: RunLoop.current, forMode: .default)
        channel.inputStream.open()
        channel.outputStream.open()
    }
    
}

extension BTManager: StreamDelegate {
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
         switch eventCode {
            case Stream.Event.openCompleted:
                print("Stream is open")
                //書き込み処理
            case Stream.Event.endEncountered:
                print("End Encountered")
            case Stream.Event.hasBytesAvailable:
                print("Bytes are available")
                if let iStream = aStream as? InputStream {
                    let bufLength = 1024
                    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufLength)
                    let bytesRead = iStream.read(buffer, maxLength: bufLength)
                    print("bytesRead = \(bytesRead)")
                    if let string = String(bytesNoCopy: buffer, length: bytesRead, encoding: .utf8, freeWhenDone: false) {
                        print("Received data: \(string)")
                    }
                }
            case Stream.Event.hasSpaceAvailable:
                print("Space is available")
            case Stream.Event.errorOccurred:
                print("Stream error")
            default:
                print("Unknown stream event")
        }
    }
}
