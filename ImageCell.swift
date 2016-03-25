//
//  ImageCell.swift
//  Instagram
//
//  Created by The Boss on 3/24/16.
//  Copyright © 2016 The Boss. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var post: ImageCollection! {
        didSet {
            imageLabel = post.image as? UIImageView
            captionLabel.text = post.caption
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
