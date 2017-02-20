//
//  NewPostController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 8/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class NewPostController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     */
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func post(_ sender: UIBarButtonItem) {
        // TODO: create post
        self.dismiss(animated: true, completion: nil)
    }

}
