//
//  FUIPeripheralManagerDelegate.swift
//  fuikit
//
//  Created by Elliot Schrock on 6/23/20.
//

import CoreBluetooth

@available(iOS 11.0, *)
class FUIPeripheralManagerDelegate: NSObject, CBPeripheralManagerDelegate {
    var onPeripheralManagerDidUpdateState: ((CBPeripheralManager) -> Void)?
    var onPeripheralManagerWillRestoreState: ((CBPeripheralManager, [String : Any]) -> Void)?
    var onPeripheralManagerDidStartAdvertising: ((CBPeripheralManager, Error?) -> Void)?
    var onPeripheralManagerDidAdd: ((CBPeripheralManager, CBService, Error?) -> Void)?
    var onPeripheralManagerDidSubscribeTo: ((CBPeripheralManager, CBCentral, CBCharacteristic) -> Void)?
    var onPeripheralManagerDidUnsubscribeFrom: ((CBPeripheralManager, CBCentral, CBCharacteristic) -> Void)?
    var onPeripheralManagerDidReceiveRead: ((CBPeripheralManager, CBATTRequest) -> Void)?
    var onPeripheralManagerDidReceiveWrite: ((CBPeripheralManager, [CBATTRequest]) -> Void)?
    var onPeripheralManagerIsReadyToUpdateSubscribers: ((CBPeripheralManager) -> Void)?
    var onPeripheralManagerDidPublishL2CAPChannel: ((CBPeripheralManager, CBL2CAPPSM, Error?) -> Void)?
    var onPeripheralManagerDidUnpublishL2CAPChannel: ((CBPeripheralManager, CBL2CAPPSM, Error?) -> Void)?
    var onPeripheralManagerDidOpen: ((CBPeripheralManager, CBL2CAPChannel?, Error?) -> Void)?
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        onPeripheralManagerDidUpdateState?(peripheral)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, willRestoreState dict: [String : Any]) {
        onPeripheralManagerWillRestoreState?(peripheral, dict)
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        onPeripheralManagerDidStartAdvertising?(peripheral, error)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        onPeripheralManagerDidAdd?(peripheral, service, error)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        onPeripheralManagerDidSubscribeTo?(peripheral, central, characteristic)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        onPeripheralManagerDidUnsubscribeFrom?(peripheral, central, characteristic)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        onPeripheralManagerDidReceiveRead?(peripheral, request)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        onPeripheralManagerDidReceiveWrite?(peripheral, requests)
    }
    
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        onPeripheralManagerIsReadyToUpdateSubscribers?(peripheral)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didPublishL2CAPChannel PSM: CBL2CAPPSM, error: Error?) {
        onPeripheralManagerDidPublishL2CAPChannel?(peripheral, PSM, error)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didUnpublishL2CAPChannel PSM: CBL2CAPPSM, error: Error?) {
        onPeripheralManagerDidUnpublishL2CAPChannel?(peripheral, PSM, error)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didOpen channel: CBL2CAPChannel?, error: Error?) {
        onPeripheralManagerDidOpen?(peripheral, channel, error)
    }
}
