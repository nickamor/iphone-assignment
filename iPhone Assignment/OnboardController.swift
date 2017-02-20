//
//  OnboardController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 1/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class OnboardController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: UIButton) {
        let model = Model.instance
        
        let u = model.login(username.text!, passwordHash: model.passwordHash(password.text!))
        
        if u > 0 {
            performSegueWithIdentifier("LoginSegue", sender: self)
            
        } else {
            let alertController = UIAlertController(title: "Log In Error", message: "The username or password you provided was incorrect.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            password.text = ""
        }
    }
}
