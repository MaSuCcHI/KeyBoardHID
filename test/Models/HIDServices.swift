//
//  HIDServices.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/25.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

class HIDServices {
    open func getService() -> CBMutableService {
        let service = CBMutableService(type: CBUUID(string: Const.HIDService.Service.UUID),
                                       primary: true)
        setCharacteristics(service: service)
        return service
    }
    
    private func setCharacteristics(service:CBMutableService) {
        //ProtocolMode
        var uuid = CBUUID(string: Const.HIDService.Characteristics.ProtocolMode.uuid)
        var properties = Const.HIDService.Characteristics.ProtocolMode.requirement
        let permissions: CBAttributePermissions = [.readable, .writeable]
        var characteristic = CBMutableCharacteristic(type: uuid,
                                                     properties: properties,
                                                     value: nil,
                                                     permissions: permissions)
        service.characteristics = [characteristic]
        
        //Report
        uuid = CBUUID(string: Const.HIDService.Characteristics.Report.uuid)
        properties = Const.HIDService.Characteristics.Report.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        //ReportMap
        uuid = CBUUID(string: Const.HIDService.Characteristics.ReportMap.uuid)
        properties = Const.HIDService.Characteristics.ReportMap.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        //BootkeyboardInput
        uuid = CBUUID(string: Const.HIDService.Characteristics.BootKeyboardInputReport.uuid)
        properties = Const.HIDService.Characteristics.BootKeyboardInputReport.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        
        //BootkeyboardOUtput
        uuid = CBUUID(string: Const.HIDService.Characteristics.BootKeyboardOutputReport.uuid)
        properties = Const.HIDService.Characteristics.BootKeyboardOutputReport.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        //HIDInfomation
        uuid = CBUUID(string: Const.HIDService.Characteristics.HIDInfomation.uuid)
        properties = Const.HIDService.Characteristics.HIDInfomation.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
        
        //HIDControlPoint
        uuid = CBUUID(string: Const.HIDService.Characteristics.HIDControlPoint.uuid)
        properties = Const.HIDService.Characteristics.HIDControlPoint.requirement
        characteristic = CBMutableCharacteristic(type: uuid,
                                                 properties: properties,
                                                 value: nil,
                                                 permissions: permissions)
        service.characteristics?.append(characteristic)
    }
}
