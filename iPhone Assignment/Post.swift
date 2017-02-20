//
//  Post.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Post {
    var id: Int = 0
    var creatorId: Int = 0
    var timestamp: NSDate = NSDate()
    var content: String = "NoSuchPost"
    
    init() {
        
    }
    
    init (id: Int, creatorId: Int, timestamp: NSDate, content: String) {
        self.id = id
        self.creatorId = creatorId
        self.timestamp = timestamp
        self.content = content
    }
}