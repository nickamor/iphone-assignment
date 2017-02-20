//
//  Follow.swift
//  iPhone Assignment
//
//  Created by Nick Amor on 4/04/2016.
//  Copyright © 2016 Nicholas Amor. All rights reserved.
//

import Foundation

class Follow {
    var id: Int = 0
    var parentId: Int = 0
    var childId: Int = 0
    
    init(id: Int, parentId: Int, childId: Int) {
        self.id = id
        self.parentId = parentId
        self.childId = childId
    }
}