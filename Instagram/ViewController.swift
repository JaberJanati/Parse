//
//  ViewController.swift
//  Instagram
//
//  Created by The Boss on 3/19/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageCollection: ImageCollection!
    @IBOutlet weak var captionLabel: UITextField!
    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 200, 200))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(photoImageView)
        captionLabel.text = "Caption"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onCapturePress(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let editedImage = ImageCollection.resize(photoImageView.image!, newSize: CGSize(width: 250, height: 250))
        photoImageView.image = editedImage
        
        dismissViewControllerAnimated(false, completion: nil)
        
        
    }
   @IBAction func onSubmit(sender: AnyObject) {
        ImageCollection.postUserImage(photoImageView.image, withCaption: captionLabel.text!){(success: Bool, error: NSError?) -> Void in
            if success {
                print("succedded")
                self.photoImageView.image = nil
                self.captionLabel.text = nil
            } else {
                print("error: \(error?.localizedDescription)")
            }
    
        }
    }
    
    
//    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if(segue.identifier == "collectionSegue") {
//            var svc = segue.destinationViewController as! ImageViewController
//            svc.posts = imageCollection
//        }
//        
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//    }


   
}

