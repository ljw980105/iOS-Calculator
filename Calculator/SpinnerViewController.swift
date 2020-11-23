//
//  SpinnerViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 8/2/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import UIKit
import JLActivityIndicator
import XLPagerTabStrip

class SpinnerViewController: UIViewController, IndicatorInfoProvider {
    var spinner: JLActivityIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        spinner = JLActivityIndicator(on: view, mode: .path)
        spinner.reverseDirection = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    lazy var heartbeatPath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 60))
        path.addLine(to: CGPoint(x: 20, y: 60))
        path.addLine(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 60, y: 80))
        path.addLine(to: CGPoint(x: 80, y: 60))
        path.addLine(to: CGPoint(x: 100, y: 60))
        return path
    }()
    
    @IBAction func startAnimation(_ sender: UIBarButtonItem) {
        
        spinner.paths = [JLBezierPath(strokeWidth: 5.0, strokeColor: UIColor.red, strokePath: heartbeatPath),
                         JLBezierPath(strokeColor: UIColor.red, strokePath: UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100)))]
        spinner.image = UIImage(named: "divSymbol")
        spinner.enableBackDrop = true
        spinner.start()
    }
    
    @IBAction func endAnimation(_ sender: UIBarButtonItem) {
        spinner.stop()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Spinner")
    }
}
