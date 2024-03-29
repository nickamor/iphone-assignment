//
//  Model.User.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 10/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

extension User {
    var followers: [User] {
        get {
            var followers = [User]()
            
            for follow in Model.instance.follows {
                if follow.childId == self.id {
                    followers.append(Model.instance.getUserById(follow.parentId))
                }
            }
            
            return followers
        }
    }
    
    var follows: [User] {
        get {
            var follows = [User]()
            
            for follow in Model.instance.follows {
                if follow.parentId == self.id {
                    follows.append(Model.instance.getUserById(follow.childId))
                }
            }
        
            return follows
        }
    }
    
    func post(_ timestamp: Date, content: String) -> Int {
        return Model.instance.createPost(self.id, timestamp: timestamp, content: content)
    }
    
    func reply(_ postId: Int, timestamp: Date, content: String) -> Int {
        return Model.instance.createReply(postId, creatorId: self.id, timestamp: timestamp, content: content)
    }
    
    func reply(_ post: Post, timestamp:Date, content: String) -> Int {
        return reply(post.id, timestamp: timestamp, content: content)
    }
    
    func vote(_ postId: Int) -> Int {
        return Model.instance.createVote(self.id, postId: postId)
    }
    
    func vote(_ post: Post) -> Int {
        return vote(post.id)
    }
    
    func follow(_ childId: Int) -> Int {
        if childId != self.id {
            return Model.instance.createFollow(self.id, childId: childId)
        }
        
        return 0
    }
    
    func follow(_ user: User) -> Int {
        return follow(user.id)
    }
}
