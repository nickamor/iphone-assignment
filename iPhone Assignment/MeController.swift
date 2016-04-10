//
//  Home.MeController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class MeController: UIViewController {
    @IBOutlet weak var logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction() {
        Model.instance.logout()
        
        performSegueWithIdentifier("LogoutSegue", sender: self)
    }
}
