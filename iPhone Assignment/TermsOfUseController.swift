//
//  TermsOfUseController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 11/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class TermsOfUseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}