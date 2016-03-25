//
//  ImageCollection.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit

class ImageCollection: NSObject {

    var caption: String
    var image: UIImage?
    
    init(str: String, img: UIImage) {
        self.image = img as UIImage
        self.caption = str as String
    }
}
