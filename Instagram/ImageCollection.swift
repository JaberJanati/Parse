//
//  ImageCollection.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit
import Parse

class ImageCollection: NSObject {
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name : "image.png", data: imageData)
            }
        }
        return nil
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, completion: PFBooleanResultBlock?) {
        
        let post = PFObject(className: "ImageCollection")
        post["media"] = self.getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] = caption
        post["likesCount"] = 0
        post["commentsCount"] = 0
        
        post.saveInBackgroundWithBlock(completion)
    }
    
    class func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
