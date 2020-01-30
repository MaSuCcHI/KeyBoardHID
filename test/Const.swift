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
    //base XXXX
    struct DeviceInfomationService {
        struct Service {
            static let UUID: String = "180A"
        }
        
        /// サービスのキャラクタリスティックのUUID
        struct Characteristics {
            struct  ManufaturerName {
                static let uuid = "2a29"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            
            struct ModelNumber {
                static let uuid = "2a24"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct SerialNumber {
                static let uuid = "2a25"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct HardwaewRevision {
                static let uuid = "2a27"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct FirmwareRevision {
                static let uuid = "2a26"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct SoftwareRevision {
                static let uuid = "2a28"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct SystemID {
                static let uuid = "2a23"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct RgulatorDate {
                static let uuid = "2a2a"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            struct PnpID {
                static let uuid = "2a50"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
        }
        
        static let kPeripheralName = "Hoge Bluetooth"
    }
    
    struct BatteryService {
        struct Service {
            static let UUID: String = "180F"
        }
        
        /// サービスのキャラクタリスティックのUUID
        struct Characteristics {
            struct BatteryLevel {
                static let uuid = "2a19"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse,.write]
            }
            
        }
        
        static let kPeripheralName = "Hoge Bluetooth"
    }
    
    struct HIDService {
        struct Service {
            static let UUID: String = "1812"
        }

        /// サービスのキャラクタリスティックのUUID
        struct Characteristics {
            
            struct ProtocolMode {
                static let uuid: String = "2a4e"
                static let requirement: CBCharacteristicProperties = [.read,.writeWithoutResponse]
            }
            struct Report {
                static let uuid = "2a4d"
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
                static let uuid = "2a4b"
                static let requirement: CBCharacteristicProperties = [.read]
            }
            
            struct BootKeyboardInputReport {
                static let uuid = "2a22"
                static let requirement: CBCharacteristicProperties = [.read,.notify]
            }
            struct BootKeyboardOutputReport {
                static let uuid = "2a32"
                static let requirement: CBCharacteristicProperties = [.read,.write,.writeWithoutResponse]
            }
            
            struct HIDInfomation {
                static let uuid = "2a4a"
                static let requirement: CBCharacteristicProperties = [.read]
            }
            struct HIDControlPoint {
                static let uuid = "2a4c"
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
