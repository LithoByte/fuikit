//
//  FUICentralManagerDelegate.swift
//  fuikit
//
//  Created by Elliot Schrock on 6/23/20.
//

import CoreBluetooth

class FUICentralManagerDelegate: NSObject, CBCentralManagerDelegate {
    var onCentralManagerDidUpdateState: ((CBCentralManager) -> Void)?
    var onCentralManagerWillRestoreState: ((CBCentralManager, [String : Any]) -> Void)?
    var onCentralManagerDidDiscover: ((CBCentralManager, CBPeripheral, [String : Any], NSNumber) -> Void)?
    var onCentralManagerDidConnect: ((CBCentralManager, CBPeripheral) -> Void)?
    var onCentralManagerDidFailToConnect: ((CBCentralManager, CBPeripheral, Error?) -> Void)?
    var onCentralManagerDidDisconnectPeripheral: ((CBCentralManager, CBPeripheral, Error?) -> Void)?
    var onCentralManagerConnectionEventDidOccur: ((CBCentralManager, CBConnectionEvent, CBPeripheral) -> Void)?
    var onCentralManagerDidUpdateANCSAuthorizationFor: ((CBCentralManager, CBPeripheral) -> Void)?

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        onCentralManagerDidUpdateState?(central)
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        onCentralManagerWillRestoreState?(central, dict)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        onCentralManagerDidDiscover?(central, peripheral, advertisementData, RSSI)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        onCentralManagerDidConnect?(central, peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        onCentralManagerDidFailToConnect?(central, peripheral, error)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        onCentralManagerDidDisconnectPeripheral?(central, peripheral, error)
    }
    
    func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        onCentralManagerConnectionEventDidOccur?(central, event, peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didUpdateANCSAuthorizationFor peripheral: CBPeripheral) {
        onCentralManagerDidUpdateANCSAuthorizationFor?(central, peripheral)
    }
}
