//
//  ImageCell.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ImageCell: PFTableViewCell {
   
    @IBOutlet weak var captionLabel: UILabel!

    @IBOutlet weak var imageLabel: PFImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var post: PFObject! {
        didSet {
                imageLabel.file = post["media"] as? PFFile
                imageLabel.loadInBackground()
                captionLabel.text = post["caption"] as? String
            }
        }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
