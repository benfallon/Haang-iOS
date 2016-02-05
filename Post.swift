//
//  Post.swift
//  Haang
//
//  Created by Ben Fallon on 2/4/16.
//  Copyright © 2016 Benjamin Fallon. All rights reserved.
//

import UIKit

class Post: NSObject {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        
        super.init()
    }
}
