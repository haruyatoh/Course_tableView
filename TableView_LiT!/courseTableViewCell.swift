//
//  courseTableViewCell.swift
//  TableView_LiT!
//
//  Created by 矢頭春香 on 2017/02/25.
//  Copyright © 2017年 矢頭春香. All rights reserved.
//

import UIKit

class courseTableViewCell: UITableViewCell {
    
    @IBOutlet var courseLable: UILabel!
    @IBOutlet var courseImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
