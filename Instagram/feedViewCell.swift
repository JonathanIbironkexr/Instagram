//
//  feedViewCell.swift
//  Instagram
//
//  Created by user142219 on 10/3/18.
//  Copyright © 2018 user142219. All rights reserved.
//

import UIKit

class feedViewCell: UITableViewCell {

    class InstagramPostTableViewCell: UITableViewCell {
        
        @IBOutlet weak var photoView: PFImageView!
        
        var instagramPost: PFObject! {
            didSet {
                self.photoView.file = instagramPost["image"] as? PFFile
                self.photoView.loadInBackground()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
