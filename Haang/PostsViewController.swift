//
//  PostsViewController.swift
//  Haang
//
//  Created by Ben Fallon on 2/4/16.
//  Copyright © 2016 Benjamin Fallon. All rights reserved.
//

import UIKit

class PostsViewController: UITableViewController {
    
    var postStore: PostStore!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postStore.allPosts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell, with default appearance
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "UITableViewCell")
        
        //Set the text on the cell with the name that is at the nth index of posts, where n = row this cell will appear in on the tableView
        let post = postStore.allPosts[indexPath.row]
        
        cell.textLabel?.text = post.name
        cell.detailTextLabel?.text = post.phoneNumber
        
        return cell
    }
    
}
