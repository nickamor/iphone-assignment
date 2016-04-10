//
//  User.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class User {
    var id: Int = 0
    var name: String = ""
    var passwordHash: String = ""
    var iconURI: String = ""
    var backgroundURI: String = ""
    var bio: String = ""
    
    init(id: Int, name: String, passwordHash: String) {
        self.id = id
        self.name = name
        self.passwordHash = passwordHash
    }
}