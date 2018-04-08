//
//  ScanningViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/4/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit
import CoreBluetooth

class ScanningViewController: UIViewController {

    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startScanningAction(_ sender: UIButton) {
        centralManager = CBCentralManager(delegate: self , queue: nil)
    }
    
}

extension ScanningViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state{
            
        case .unknown:
            print("central.state is .unknown")
            
        case .resetting:
            print("central.state is .resetting")
            
        case .unsupported:
            print("central.state is .unsupported")
            
        case .unauthorized:
            print("central.state is .unauthorized")
            
        case .poweredOff:
            print("central.state is .poweredOff")
            
        case .poweredOn:
            print("central.state is .poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        // centralManager.stopScan()
        
    }
    
}
