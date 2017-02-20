//
//  NewReplyController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 10/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class NewReplyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reply(_ sender: UIBarButtonItem) {
        // TODO: create reply
        self.dismiss(animated: true, completion: nil)
    }
    
}
