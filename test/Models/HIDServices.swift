//
//  HIDServices.swift
//  test
//
//  Created by KEISUKE MASUDA on 2020/01/25.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

struct HIDServices {
    func getService() -> CBMutableService {
        return CBMutableService(type: CBUUID(string: Const.HIDService.Service.UUID),
                                primary: true)
    }
    
    func setCharacteristics(service:CBMutableService) {
        let uuid = CBUUID(string: Const.HIDService.Characteristic.ProtocolMode.uuid)
        let properties = Const.HIDService.Characteristic.ProtocolMode.requirement
        let permissions: CBAttributePermissions = [.readable, .writeable]
        let characteristic = CBMutableCharacteristic(type: uuid,
                                                     properties: properties,
                                                     value: nil,
                                                     permissions: permissions)
        service.characteristics?.append(characteristic)
    }
}
