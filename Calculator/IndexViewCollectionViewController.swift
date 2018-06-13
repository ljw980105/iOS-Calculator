//
//  IndexViewCollectionViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 6/12/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import UIKit
import BDKCollectionIndexView

private let reuseIdentifier = "indexCell"

class IndexViewCell: UICollectionViewCell{
    @IBOutlet weak var colorView: UIView!
    var color: UIColor! {
        didSet{
            colorView.backgroundColor = color
        }
    }
    
}

class IndexViewCollectionViewController: UICollectionViewController {
    let indexTitles = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N"]
    var indexView: BDKCollectionIndexView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
        self.loadIndexView(with: indexTitles)
    }
    
    func randomRGB255() -> CGFloat{
        return  CGFloat(arc4random_uniform(255) + 1) / CGFloat(255)
    }
    
    func loadIndexView(with sectionTitles: [String]){
        if indexView != nil { indexView.removeFromSuperview() }
        let indexWidth:CGFloat = 14.0
        let frameWidth = collectionView?.frame.width
        let frameHeight = collectionView?.frame.size.height
        print("Frameheight: \(frameHeight ?? 0)")
        let frame = CGRect(x: frameWidth! - 14, y: 0, width: indexWidth, height: frameHeight!)
        indexView = BDKCollectionIndexView(frame: frame, indexTitles: nil)
        indexView.indexTitles = sectionTitles
        indexView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        indexView.tintColor = UIColor.blue
        indexView.addTarget(self, action: #selector(self.indexViewValueChanged(sender:)), for: .valueChanged)
        self.view.addSubview(indexView!)
        self.view.bringSubview(toFront: indexView!)
    }
    
    @objc func indexViewValueChanged(sender: BDKCollectionIndexView){
        let indexPath = IndexPath(item: 0, section: Int(sender.currentIndex))
        collectionView?.scrollToItem(at: indexPath, at: .top, animated: false)
    }
    
    func randomColor() -> UIColor{
        return UIColor(red: randomRGB255(),
                       green: randomRGB255(),
                       blue: randomRGB255(),
                       alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 20
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return indexTitles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        if let colorCell = cell as? IndexViewCell {
            colorCell.color = randomColor()
        }
    
        return cell
    }
}
