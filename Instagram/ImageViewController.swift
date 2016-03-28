//
//  ImageViewController.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ImageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var images: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getParseData()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogOut(sender: AnyObject) {
        
        PFUser.logOut()
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if images == nil {
            return 0
        }
        else {
            return images!.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
        cell.post = images![indexPath.row]
        
        return cell
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    func getParseData() {
        let query = PFQuery(className: "ImageCollection")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        print("RAN PARSE DATA")
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
           if let posts = posts {
                print(posts)
                self.images = posts
                self.tableView.reloadData()
                print("Posted!")
           } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
