//
//  Model.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Model {
    static let instance = Model()
    
    private init() {
        let aliceId = createUser("alice", passwordHash: passwordHash("alice"))
        let bobId = createUser("bob", passwordHash: passwordHash("password"))
        
        getUserById(aliceId).displayname = "Alice"
        getUserById(bobId).displayname = "Bob"
        
        let firstPostId = createPost(aliceId, timestamp: NSDate(), content: "Hello, World!")
        createReply(firstPostId, creatorId: bobId, timestamp: NSDate(), content: "Bonjour tout le monde!")
    }
    
    var users: [User] = [User]()
    var posts: [Post] = [Post]()
    var replies: [Reply] = [Reply]()
    var votes: [Vote] = [Vote]()
    var follows: [Follow] = [Follow]()
    
    var currentUserId: Int = 0
    
    func login(username: String, passwordHash: String) -> Int {
        for user: User in users {
            if user.username == username && user.passwordHash == passwordHash {
                currentUserId = user.id
            }
        }
        
        return currentUserId
    }
    
    func logout() -> Bool {
        currentUserId = 0
        
        return true
    }
    
    func passwordHash(password: String) -> String {
        var hashedString = ""
        
        hashedString += password + "1"

        return hashedString
    }
    
    func createUser(username: String, passwordHash: String) -> Int {
        let newUser = User(id: generateUserId(), username: username, displayname: username, passwordHash: passwordHash)

        users.append(newUser)
        
        return newUser.id
    }
    
    func createPost(creatorId: Int, timestamp: NSDate, content: String) -> Int {
        let newPost = Post(id: generatePostId(), creatorId: creatorId, timestamp: timestamp, content: content)
        
        posts.append(newPost)
        
        createVote(creatorId, postId: newPost.id)
        
        return newPost.id
    }
    
    func createVote(userId: Int, postId: Int) -> Int {
        return 0
    }
    
    func createReply(postId: Int, creatorId: Int, timestamp: NSDate, content: String) -> Int {
        let newReply = Reply(id: generateReplyId(), postId: postId, creatorId: creatorId, timestamp: timestamp, content: content)
        
        replies.append(newReply)
        
        return newReply.id
    }
    
    func createFollow() -> Int {
        return 0
    }
    
    func generateUserId() -> Int {
        return nextRand(1000, max: 1999)
    }
    
    func generatePostId() -> Int {
        return nextRand(2000, max: 2999)
    }
    
    func generateReplyId() -> Int {
        return nextRand(3000, max: 3999)
    }
    
    func nextRand(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32((max - min) + 1)))
    }
    
    func getUserById(id: Int) -> User {
        for user in users {
            if (user.id == id) {
                return user
            }
        }
        
        return User()
    }
    
    func currentUser() -> User {
        return getUserById(currentUserId)
    }
}

extension Post {
    func creator() -> User {
        return Model.instance.getUserById(self.creatorId)
    }
}