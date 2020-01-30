//
//  DiveceInfomationServices.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/26.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class DeviceInfomationServices {
    open func getService() -> CBMutableService {
        let service = CBMutableService(type: CBUUID(string: Const.DeviceInfomationService.Service.UUID), primary: true)
        setCharacteristics(service: service)
        return service
    }
    
    private func setCharacteristics(service:CBMutableService) {
        //ProtocolMode
        var uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.FirmwareRevision.uuid)
        var properties = Const.DeviceInfomationService.Characteristics.FirmwareRevision.requirement
        let permissions: CBAttributePermissions = [.readable, .writeable]
        var characteristic = CBMutableCharacteristic(type: uuid,
                                                     properties: properties,
                                                     value: nil,
                                                     permissions: permissions)
        service.characteristics = [characteristic]
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.HardwaewRevision.uuid)
        properties = Const.DeviceInfomationService.Characteristics.HardwaewRevision.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.ManufaturerName.uuid)
        properties = Const.DeviceInfomationService.Characteristics.ManufaturerName.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.ModelNumber.uuid)
        properties = Const.DeviceInfomationService.Characteristics.ModelNumber.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.PnpID.uuid)
        properties = Const.DeviceInfomationService.Characteristics.PnpID.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.RgulatorDate.uuid)
        properties = Const.DeviceInfomationService.Characteristics.RgulatorDate.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        uuid = CBUUID(string: Const.DeviceInfomationService.Characteristics.SerialNumber.uuid)
        properties = Const.DeviceInfomationService.Characteristics.SerialNumber.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
    }
}
