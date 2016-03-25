//
//  ImageViewController.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts: [ImageCollection]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts == nil {
            return 0
        }
        else {
            return posts.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
        cell.post = posts[indexPath.row]
        
        return cell
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
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
