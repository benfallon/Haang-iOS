//
//  PostStore.swift
//  Haang
//
//  Created by Ben Fallon on 2/4/16.
//  Copyright © 2016 Benjamin Fallon. All rights reserved.
//

import UIKit

class PostStore {
    
    var allPosts = [Post]()
    
    func createPost() -> Post {
        let newPost = Post(name: "Name", phoneNumber: "8889990000")
        
        allPosts.append(newPost)
        
        return newPost
    }
    
    func removePost(post: Post) {
        if let index = allPosts.indexOf(post) {
            allPosts.removeAtIndex(index)
        }
    }
}
