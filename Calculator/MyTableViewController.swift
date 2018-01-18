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
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private func getIcon(with location:String) -> UIImage?{
        let imgSrc = documentsUrl.appendingPathComponent(location)
        print("\(imgSrc)")
        //let imgSrc = URL(string: location)
        let urlContents = try? Data(contentsOf: imgSrc)
        if (urlContents != nil){
            return UIImage(data: urlContents!)
        }
        return nil
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // generate an edit button
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let fileManager = FileManager.default
        //let imagePath = (fileManager.currentDirectoryPath as NSString).strings(byAppendingPaths: ["FirstAppIcon-20@3x.png"])
        let imagePath = ".." + (fileManager.currentDirectoryPath as String) + "testIcon.png"
        print("\(imagePath)");
        
        self.title = "Welcome"
        //RegCalc.imageView?.image = getImage(with: "https://ljw980105.github.io/Images/icon%20png.png")
        //let imgData = try? Data(contentsOf: URL(string: imagePath)!)
        CoreMo.imageView?.image = getIcon(with: "testIcon.png")
        
        //RegCalc.textLabel?.text = "Regular Calculator"
        
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
        }
        
        if let dest = destinationViewController as? CoreMotionViewController{
            dest.navigationItem.title = (sender as? UITableViewCell)?.textLabel?.text        }
    }
    

}
