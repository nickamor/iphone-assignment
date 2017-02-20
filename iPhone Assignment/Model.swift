//
//  Model.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Model {
    static let instance = Model()
    
    // Pre-populate the social network
    func generate() {
        let commonPasswordHash = passwordHash("password")
        
        func assertGTZ(_ value: Int) {
            assert(value > 0, "Unexpected value \(value), interal error")
        }
        
        // users
        let alice = getUserById(createUser("alice", passwordHash: commonPasswordHash))
        let bob = getUserById(createUser("bob", passwordHash: passwordHash("bob")))
        let cristina = getUserById(createUser("cristina", passwordHash: commonPasswordHash))
        let dale = getUserById(createUser("dale", passwordHash: commonPasswordHash))
        let evan = getUserById(createUser("evan", passwordHash: commonPasswordHash))
        let franky = getUserById(createUser("franky", passwordHash: commonPasswordHash))
        let geoff = getUserById(createUser("geoff", passwordHash: commonPasswordHash))
        assertGTZ(createUser("harriette", passwordHash: commonPasswordHash))
        let imogenId = createUser("imogen", passwordHash: commonPasswordHash)
        
        // posts
        let firstPost = alice.post(Date(), content: "Hello, World! This is the first post. Lorem ipsum dolor sit amet.")
        assertGTZ(bob.reply(firstPost, timestamp: Date(), content: "Bonjour tout le monde! This is the first reply to the first post."))
        
        let secondPost = cristina.post(Date(), content: "This is the second post. orem Ipsum is simply dummy text of the printing and typesetting industry.")
        assertGTZ(cristina.reply(secondPost, timestamp: Date(), content: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."))
        assertGTZ(alice.reply(secondPost, timestamp: Date(), content: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."))
        
        // votes
        for post in posts {
            assertGTZ(dale.vote(post))
        }
        
        // follows
        assertGTZ(alice.follow(bob))
        assertGTZ(bob.follow(alice))
        
        assertGTZ(dale.follow(evan))
        assertGTZ(dale.follow(franky))
        assertGTZ(evan.follow(dale))
        assertGTZ(evan.follow(franky))
        assertGTZ(franky.follow(dale))
        assertGTZ(franky.follow(evan))
        
        // geoff follows everyone
        for user in users {
            if user.id != geoff.id {
                assertGTZ(geoff.follow(user))
            }
        }
        
        // everyone follows imogen
        for user in users {
            if user.id != imogenId {
                assertGTZ(user.follow(imogenId))
            }
        }
    }
    
    var users: [User] = [User]()
    var posts: [Post] = [Post]()
    var replies: [Reply] = [Reply]()
    var votes: [Vote] = [Vote]()
    var follows: [Follow] = [Follow]()
    
    var currentUserId: Int = 0
    
    func login(_ username: String, passwordHash: String) -> Int {
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
    
    func passwordHash(_ password: String) -> String {
        var hashedString = ""
        
        // TODO: stronger hash function
        hashedString += password + "1"

        return hashedString
    }
    
    func createUser(_ username: String, passwordHash: String) -> Int {
        let newUser = User(id: generateUserId(), username: username, displayname: username, passwordHash: passwordHash)

        users.append(newUser)
        
        return newUser.id
    }
    
    func createPost(_ creatorId: Int, timestamp: Date, content: String) -> Int {
        let newPost = Post(id: generatePostId(), creatorId: creatorId, timestamp: timestamp, content: content)
        
        posts.append(newPost)
        
        assert(createVote(creatorId, postId: newPost.id) > 0, "Unexpected lack of vote id, internal error")
        
        return newPost.id
    }
    
    func createVote(_ userId: Int, postId: Int) -> Int {
        let newVote = Vote(id: generateVoteId(), userId: userId, postId: postId)
        
        votes.append(newVote)
        
        return newVote.id
    }
    
    func createReply(_ postId: Int, creatorId: Int, timestamp: Date, content: String) -> Int {
        let newReply = Reply(id: generateReplyId(), postId: postId, creatorId: creatorId, timestamp: timestamp, content: content)
        
        replies.append(newReply)
        
        return newReply.id
    }
    
    func createFollow(_ parentId: Int, childId: Int) -> Int {
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
    
    func nextRand(_ min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32((max - min) + 1)))
    }
    
    func getUserById(_ id: Int) -> User {
        for user in users {
            if user.id == id {
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
