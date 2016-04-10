//
//  Model.User.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 10/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

extension User {
    func followers() -> [User] {
        var followers = [User]()
        
        for follow in Model.instance.follows {
            if (follow.victimId == self.id) {
                followers.append(Model.instance.getUserById(follow.stalkerId))
            }
        }
        
        return followers
    }
    
    func follows() -> [User] {
        var follows = [User]()
        
        for follow in Model.instance.follows {
            if (follow.stalkerId == self.id) {
                follows.append(Model.instance.getUserById(follow.victimId))
            }
        }
        
        return follows
    }
}