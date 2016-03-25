//
//  LoginViewController.swift
//  Instagram
//
//  Created by The Boss on 3/19/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(userName.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("you logged in")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }
        }
    }

    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = userName.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock{(success: Bool, error: NSError?) -> Void in
            if success {
            print("sign up succeeded")
            }
            else
            {
                print(error?.localizedDescription)
            }
            
            if error?.code == 202 {
                print("account already exists")
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
