//
//  Votes.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Vote {
    var id: Int = 0
    var userId: Int = 0
    var postId: Int = 0
    
    init(id: Int, userId: Int, postId: Int) {
        self.id = id
        self.userId = userId
        self.postId = postId
    }
}