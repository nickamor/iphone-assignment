//
//  Model.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Model {
    var users: [User] = [User]()
    var posts: [Post] = [Post]()
    var replies: [Reply] = [Reply]()
    var votes: [Vote] = [Vote]()
    var follows: [Follow] = [Follow]()
    
    var currentUser: Int = 0
    
    func login(username: String, password: String) -> Int {
        for user: User in users {
            if user.name == username && user.password == password {
                currentUser = user.id
            }
        }
        
        return currentUser
    }
}