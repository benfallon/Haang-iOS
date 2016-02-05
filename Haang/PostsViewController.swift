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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postStore.allPosts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        //Set the text on the cell with the name that is at the nth index of posts, where n = row this cell will appear in on the tableView
        let post = postStore.allPosts[indexPath.row]
        
        cell.textLabel?.text = post.name
        cell.detailTextLabel?.text = post.phoneNumber
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //If the table view is asking to commit a delete command...
        if editingStyle == .Delete {
            let post = postStore.allPosts[indexPath.row]
            //Remove the post from the store
            postStore.removePost(post)
            
            //Also remove that row from the table view with an animation
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    @IBAction func addNewPost(sender: AnyObject) {
        //Create a new post and add it to the store
        let newPost = postStore.createPost()
        
        //Figure out where that post is in the array
        if let index = postStore.allPosts.indexOf(newPost) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            //Insert this new row into the table
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        //If you are currently in editing mode...
        if editing {
            //Change text of button to inform user of state
            sender.setTitle("Edit", forState: .Normal)
            
            //Turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            //Change text of button to inform user of state
            sender.setTitle("Done", forState: .Normal)
            
            //Enter editing mode
            setEditing(true, animated: true)
        }
    }
    
}
