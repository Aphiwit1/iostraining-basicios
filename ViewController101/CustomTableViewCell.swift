//
//  CustomTableViewCell.swift
//  ViewController101
//
//  Created by AphiwitSCB on 13/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mSubtitle: UILabel!
    @IBOutlet weak var mYoutube: UIImageView!
    @IBOutlet weak var mAvatar: UIImageView!
    
    @IBOutlet weak var mCardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
