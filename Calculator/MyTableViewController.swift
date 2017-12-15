//
//  MyTableViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 12/15/17.
//  Copyright © 2017 Jing Wei Li. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    let variable = ["Regular Calculator","Graphic Calculator", "Core Motion", "Image Shower"]
    var label:UILabel = UILabel()

    @IBOutlet weak var RegCalc: UITableViewCell!
    @IBOutlet weak var CoreMo: UITableViewCell!
    @IBOutlet weak var ImgShower: UITableViewCell!
    @IBOutlet weak var GraphCalc: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Welcome"
        RegCalc.textLabel?.text = "Regular Calculator"
        CoreMo.textLabel?.text = "Core Motion"
        ImgShower.textLabel?.text = "Image Shower"
        GraphCalc.textLabel?.text = "Graphic Calculator"
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationViewController = destinationViewController as? UINavigationController {
            destinationViewController = navigationViewController.visibleViewController ?? destinationViewController
        }
        if let dest = destinationViewController as? CalcViewController{
            //dest.navigationItem.title = label.text
            dest.navigationItem.title = (sender as? UITableViewCell)?.textLabel?.text
        }
        
        if let dest = destinationViewController as? ImageShowerControlleer{
            dest.navigationItem.title = (sender as? UITableViewCell)?.textLabel?.text
            //dest.navigationItem.title = label.text
        }
        
        if let dest = destinationViewController as? CoreMotionViewController{
            dest.navigationItem.title = (sender as? UITableViewCell)?.textLabel?.text
            //dest.navigationItem.title = label.text
        }
    }
    

}