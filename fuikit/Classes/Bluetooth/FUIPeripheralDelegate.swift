//
//  FUIPeripheralDelegate.swift
//  fuikit
//
//  Created by Elliot Schrock on 6/23/20.
//

import UIKit
import CoreBluetooth

@available(iOS 11.0, *)
open class FUIPeripheralDelegate: NSObject, CBPeripheralDelegate {
    var onPeripheralDidUpdateName: ((CBPeripheral) -> Void)?
    var onPeripheralDidModifyServices: ((CBPeripheral) -> Void)?
    var onPeripheralDidUpdateRSSI: ((CBPeripheral) -> Void)?
    var onPeripheralDidReadRSSI: ((CBPeripheral) -> Void)?
    var onPeripheralDidDiscoverServices: ((CBPeripheral, Error?) -> Void)?
    var onPeripheralDidDiscoverIncludedServicesFor: ((CBPeripheral, CBService, Error?) -> Void)?
    var onPeripheralDidDiscoverCharacteristicsFor: ((CBPeripheral, CBService, Error?) -> Void)?
    var onPeripheralDidUpdateValueForCharacteristic: ((CBPeripheral, CBCharacteristic, Error?) -> Void)?
    var onPeripheralDidWriteValueForCharacteristic: ((CBPeripheral, CBCharacteristic, Error?) -> Void)?
    var onPeripheralDidUpdateNotificationStateFor: ((CBPeripheral, CBCharacteristic, Error?) -> Void)?
    var onPeripheralDidDiscoverDescriptorsFor: ((CBPeripheral, CBCharacteristic, Error?) -> Void)?
    var onPeripheralDidUpdateValueForDescriptor: ((CBPeripheral, CBDescriptor, Error?) -> Void)?
    var onPeripheralDidWriteValueForDescriptor: ((CBPeripheral, CBDescriptor, Error?) -> Void)?
    var onPeripheralIsReadyToSendWriteWithoutResponse: ((CBPeripheral) -> Void)?
    var onPeripheralDidOpen: ((CBPeripheral, CBL2CAPChannel?, Error?) -> Void)?

    open func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        onPeripheralDidUpdateName?(peripheral)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        onPeripheralDidModifyServices?(peripheral)
    }
    
    open func peripheralDidUpdateRSSI(_ peripheral: CBPeripheral, error: Error?) {
        onPeripheralDidUpdateRSSI?(peripheral)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        onPeripheralDidReadRSSI?(peripheral)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        onPeripheralDidDiscoverServices?(peripheral, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didDiscoverIncludedServicesFor service: CBService, error: Error?) {
        onPeripheralDidDiscoverIncludedServicesFor?(peripheral, service, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        onPeripheralDidDiscoverCharacteristicsFor?(peripheral, service, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        onPeripheralDidUpdateValueForCharacteristic?(peripheral, characteristic, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        onPeripheralDidWriteValueForCharacteristic?(peripheral, characteristic, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        onPeripheralDidUpdateNotificationStateFor?(peripheral, characteristic, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        onPeripheralDidDiscoverDescriptorsFor?(peripheral, characteristic, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        onPeripheralDidUpdateValueForDescriptor?(peripheral, descriptor, error)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        onPeripheralDidWriteValueForDescriptor?(peripheral, descriptor, error)
    }
    
    open func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        onPeripheralIsReadyToSendWriteWithoutResponse?(peripheral)
    }
    
    open func peripheral(_ peripheral: CBPeripheral, didOpen channel: CBL2CAPChannel?, error: Error?) {
        onPeripheralDidOpen?(peripheral, channel, error)
    }
}
