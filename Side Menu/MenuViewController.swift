//
//  MenuViewController.swift
//  Side Menu
//
//  Created by Rahul Sharma on 14/09/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var items = ["IOS","Android","Jave Script","Oracle","SAP","Magento"]
    var overlayView: UIView = UIView()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:
        overlayView = UIView(frame: self.view.frame)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.5
        
        
        //Mark:
        overlayView.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        overlayView.isUserInteractionEnabled = true
        let closeGesture = UITapGestureRecognizer(target: self.revealViewController(), action: #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void))
        overlayView.addGestureRecognizer(closeGesture)
        
        //Mark:
        tableView.tableFooterView = UIView()
    
    }
    
    //Mark:
    override func viewWillAppear(_ animated: Bool) {

        //Mark:
        self.revealViewController().frontViewController.view.addSubview(overlayView)
        
    }
    
    
    //Mark:
    override func viewWillDisappear(_ animated: Bool) {
        overlayView.removeFromSuperview()
        
    }
    
    
    //Mark:
    func revealControllerPanGestureEnded(_ revealController: SWRevealViewController!) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    //Mark:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCells", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = UIFont(name:"HelveticaNeue", size: 16.0)
        cell.textLabel?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
    }

}
