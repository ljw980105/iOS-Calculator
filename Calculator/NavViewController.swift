//
//  GraphViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 11/11/17.
//  Copyright © 2017 Jing Wei Li. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Welcome";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationViewController = destinationViewController as? UINavigationController {
            destinationViewController = navigationViewController.visibleViewController ?? destinationViewController
        }
        if let dest = destinationViewController as? CalcViewController{
            dest.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
        
        if let dest = destinationViewController as? ImageShowerControlleer{
            dest.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
        
        if let dest = destinationViewController as? CoreMotionViewController{
            dest.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
    

}
