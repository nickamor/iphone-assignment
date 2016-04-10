//
//  Reply.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Reply {
    var id: Int = 0
    var postId: Int = 0
    var creatorId: Int = 0
    var timestamp: NSDate = NSDate()
    var content: String = ""
    
    init(id: Int, postId: Int, creatorId: Int, timestamp: NSDate, content: String) {
        self.id = id
        self.postId = postId
        self.creatorId = creatorId
        self.timestamp = timestamp
        self.content = content
    }
}