//
//  Onboard.NewUserController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 11/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class NewUserController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if Model.instance.login("bob", passwordHash: Model.instance.passwordHash("bob")) > 0 {
            performSegue(withIdentifier: "LoginAction", sender: self)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
