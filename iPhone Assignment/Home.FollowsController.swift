//
//  Home.FollowsController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class FollowsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let follows = Model.instance.currentUser().follows
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return follows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}