//
//  AddActivesViewController.swift
//  Haang
//
//  Created by Ben Fallon on 2/4/16.
//  Copyright © 2016 Benjamin Fallon. All rights reserved.
//

import UIKit

class AddActivesViewController: UITableViewController {
    
    var post: Post!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        navigationItem.title = "Contacts with Haang"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        //Set the text on the cell with the name that is at the nth index of posts, where n = row this cell will appear in on the tableView
        let post = Post(name: "test", phoneNumber: "1112223333")
        
        cell.textLabel?.text = post.name
        cell.detailTextLabel?.text = post.phoneNumber
        
        return cell
    }
    

}
