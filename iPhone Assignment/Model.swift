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
    
    func generate() {
        let commonPasswordHash = passwordHash("password")
        
        // users
        let alice = getUserById(createUser("alice", passwordHash: commonPasswordHash))
        let bob = getUserById(createUser("bob", passwordHash: passwordHash("bob")))
        let cristina = getUserById(createUser("cristina", passwordHash: commonPasswordHash))
        let dale = getUserById(createUser("dale", passwordHash: commonPasswordHash))
        let evan = getUserById(createUser("evan", passwordHash: commonPasswordHash))
        let franky = getUserById(createUser("franky", passwordHash: commonPasswordHash))
        let geoff = getUserById(createUser("geoff", passwordHash: commonPasswordHash))
        createUser("harriette", passwordHash: commonPasswordHash)
        let imogenId = createUser("imogen", passwordHash: commonPasswordHash)
        
        // posts
        let firstPost = alice.post(NSDate(), content: "Hello, World! This is the first post. Lorem ipsum dolor sit amet.")
        bob.reply(firstPost, timestamp: NSDate(), content: "Bonjour tout le monde! This is the first reply to the first post.")
        
        let secondPost = cristina.post(NSDate(), content: "This is the second post. orem Ipsum is simply dummy text of the printing and typesetting industry.")
        cristina.reply(secondPost, timestamp: NSDate(), content: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
        alice.reply(secondPost, timestamp: NSDate(), content: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
        
        // votes
        for post in posts {
            dale.vote(post)
        }
        
        // follows
        alice.follow(bob)
        bob.follow(alice)
        
        dale.follow(evan)
        dale.follow(franky)
        evan.follow(dale)
        evan.follow(franky)
        franky.follow(dale)
        franky.follow(evan)
        
        for user in users {
            geoff.follow(user)
        }
        
        for user in users {
            user.follow(imogenId)
        }
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
                break
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
        
        // TODO: stronger hash function
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
        let newVote = Vote(id: generateVoteId(), userId: userId, postId: postId)
        
        votes.append(newVote)
        
        return newVote.id
    }
    
    func createReply(postId: Int, creatorId: Int, timestamp: NSDate, content: String) -> Int {
        let newReply = Reply(id: generateReplyId(), postId: postId, creatorId: creatorId, timestamp: timestamp, content: content)
        
        replies.append(newReply)
        
        return newReply.id
    }
    
    func createFollow(parentId: Int, childId: Int) -> Int {
        let newFollow = Follow(id: generateFollowId(), parentId: parentId, childId: childId)
        
        follows.append(newFollow)
        
        return newFollow.id
    }
    
    func generateUserId() -> Int {
        return nextRand(100000, max: 199999)
    }
    
    func generatePostId() -> Int {
        return nextRand(200000, max: 299999)
    }
    
    func generateReplyId() -> Int {
        return nextRand(300000, max: 399999)
    }
    
    func generateVoteId() -> Int {
        return nextRand(400000, max: 499999)
    }
    
    func generateFollowId() -> Int {
        return nextRand(500000, max: 599999)
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
    var creator: User {
        get {
            return Model.instance.getUserById(self.creatorId)
        }
    }
    
    var replies: [Reply] {
        get {
            var replies: [Reply] = [Reply]()
            
            for reply in Model.instance.replies {
                if reply.postId == self.id {
                    replies.append(reply)
                }
            }
            
            return replies
        }
    }
}

extension Reply {
    var creator: User {
        get {
            return Model.instance.getUserById(self.creatorId)
        }
    }
}