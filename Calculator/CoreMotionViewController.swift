//
//  CoreMotionViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 11/30/17.
//  Copyright © 2017 Jing Wei Li. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {
    let motionManager = CMMotionManager()
    var timer: Timer!

    @IBOutlet weak var GyroData: UILabel!
    @IBOutlet weak var AccelData: UILabel!
    @IBOutlet weak var MagnetometerData: UILabel!
    @IBOutlet weak var DevMotionData: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        motionManager.stopGyroUpdates()
        motionManager.startAccelerometerUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        GyroData.text = "0"
        AccelData.text = "0"
        MagnetometerData.text = "0"
        DevMotionData.text = "0"
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(CoreMotionViewController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        if let dataAccel = motionManager.accelerometerData{
            AccelData.text = String(dataAccel.acceleration.x)
        }
        if let dataGyro = motionManager.gyroData{
            GyroData.text = String(dataGyro.rotationRate.z)
        }
        if let dataMagnet = motionManager.magnetometerData{
            MagnetometerData.text = String(dataMagnet.magneticField.x)
        }
        if let dataDevMo = motionManager.deviceMotion{
            // returns a value between -185 and 185
            DevMotionData.text = String(Int(dataDevMo.attitude.yaw * 60))
        }
    }
    

}
