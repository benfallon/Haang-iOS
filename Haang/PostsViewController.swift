//
//  PostsViewController.swift
//  Haang
//
//  Created by Ben Fallon on 2/4/16.
//  Copyright © 2016 Benjamin Fallon. All rights reserved.
//

import UIKit

import Parse

class PostsViewController: UITableViewController {
    
    var postStore: PostStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //If the triggered segue is the ShowActivesList segue
        if segue.identifier == "ShowActivesList" {
            
            let post = postStore.createPost()
            let addActivesViewController = segue.destinationViewController as! AddActivesViewController
            addActivesViewController.post = post
        }
    }
    
}
