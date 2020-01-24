//
//  Const.swift
//  testKeyboard
//
//  Created by KEISUKE MASUDA on 2020/01/15.
//  Copyright © 2020 KEISUKE MASUDA. All rights reserved.
//

import Foundation
import CoreBluetooth

struct Const {
    //base 0000XXXX-0000-1000-8000-00805f9b34fb
    struct DeviceInfomationService {
        struct Service {
            static let UUID: String = "0000180A-0000-1000-8000-00805f9b34fb"
        }
        
        /// サービスのキャラクタリスティックのUUID
        struct Characteristic {
            static let manufaturerName = "00002a29-0000-1000-8000-00805f9b34fb"
            static let modelNumber = "00002a24-0000-1000-8000-00805f9b34fb"
            static let serialNumber = "00002a25-0000-1000-8000-00805f9b34fb"
            static let hardwareRevision = "00002a27-0000-1000-8000-00805f9b34fb"
            static let firmwareRevision = "00002a26-0000-1000-8000-00805f9b34fb"
            static let softwareRevision = "00002a28-0000-1000-8000-00805f9b34fb"
            static let systemID = "00002a23-0000-1000-8000-00805f9b34fb"
            static let regulatoryData = "00002a2a-0000-1000-8000-00805f9b34fb"
            static let pnpID = "00002a50-0000-1000-8000-00805f9b34fb"
        }
        
        static let kPeripheralName = "Hoge Bluetooth"
    }
    
    struct BatteryService {
        struct Service {
            static let UUID: String = "0000180F-0000-1000-8000-00805f9b34fb"
        }
        
        /// サービスのキャラクタリスティックのUUID
        struct Characteristic {
            static let batteryLevel = "00002a19-0000-1000-8000-00805f9b34fb"
        }
        
        static let kPeripheralName = "Hoge Bluetooth"
    }
    
    struct HIDService {
        struct Service {
            static let UUID: String = "00001812-0000-1000-8000-00805F9B34FB"
        }

        /// サービスのキャラクタリスティックのUUID
        struct Characteristics {
            struct ProtocolMode {
                static let uuid: String = "00002a4e-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse]
            }
            struct Report {
                static let uuid = "00002a4d-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read,.write,.writeWithoutResponse]
                struct input {
                    static let requirement: CBCharacteristicProperties = [.read,.notify]
                }
                struct output {
                    static let requirement: CBCharacteristicProperties = [.read,.write,.writeWithoutResponse]
                }
                struct feature {
                    static let requirement: CBCharacteristicProperties = [.read,.write]
                }
            }
            
            struct ReportMap {
                static let uuid = "00002a4b-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read]
            }
            
            struct BootKeyboardInputReport {
                static let uuid = "00002a22-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read,.notify]
            }
            struct BootKeyboardOutputReport {
                static let uuid = "00002a32-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read,.write,.writeWithoutResponse]
            }
            
            struct HIDInfomation {
                static let uuid = "00002a4a-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.read]
            }
            struct HIDControlPoint {
                static let uuid = "00002a4c-0000-1000-8000-00805f9b34fb"
                static let requirement: CBCharacteristicProperties = [.writeWithoutResponse]
            }
        }
        
        struct ReportID {
            static let keyboard = 0x03
            static let mouse = 0x02
        }
        
//        static let header = { USAGE_PAGE(1),      0x01}
        
        static let kPeripheralName = "Hoge Bluetooth"
    
    }
}
