//
//  User.swift
//  iPhone Assignment
//
//  Created by Nicholas Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class User {
    var id: Int = 0
    var username: String = ""
    var displayname: String = "NoSuchUser"
    var passwordHash: String = ""
    var iconURI: String = ""
    var backgroundURI: String = ""
    var bio: String = ""
    
    init() {
        
    }
    
    init(id: Int, username: String, displayname: String, passwordHash: String) {
        self.id = id
        self.username = username
        self.displayname = displayname
        self.passwordHash = passwordHash
    }
}
