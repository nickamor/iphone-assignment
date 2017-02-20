//
//  Post.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Post {
    var id: Int = 0
    var creatorId: Int = 0
    var timestamp: Date = Date()
    var content: String = "NoSuchPost"
    
    init() {
        
    }
    
    init (id: Int, creatorId: Int, timestamp: Date, content: String) {
        self.id = id
        self.creatorId = creatorId
        self.timestamp = timestamp
        self.content = content
    }
}
