//
//  ViewController.swift
//  Side Menu
//
//  Created by Rahul Sharma on 14/09/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imgMenu = UIImage(named:"home_navigation_button")
        let menuButton = UIBarButtonItem(image:imgMenu, style: UIBarButtonItemStyle.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = menuButton
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

