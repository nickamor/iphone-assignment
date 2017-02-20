//
//  PostDetailController.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import UIKit

class PostDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var votes: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let model: Model = Model.instance
    
    // TODO: get model only for this post
    let post: Post = Model.instance.posts[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = post.creator
        
        name.text = user.displayname
        timestamp.text = post.timestamp.description
        //timestamp.text = ""
        content.text = post.content
        
        /**
        TODO:
        if current user voted on this post
        set text to "👍 x votes"
        where x is the number of votes on this post
        **/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.replies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReplyTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ReplyTableViewCell
        
        let reply = post.replies[indexPath.row]
        
        cell.name.text = reply.creator.displayname
        cell.timestamp.text = reply.timestamp.description
        //cell.timestamp.text = ""
        cell.content.text = reply.content
        
        return cell
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
