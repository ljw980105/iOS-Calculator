//
//  TabStripViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 12/21/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TabStripViewController: SegmentedPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /**
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = UIColor.purple
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
         */
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let vc1 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "spinnerVC")
        let vc2 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "collectionViewColors")
        return [vc1, vc2]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
