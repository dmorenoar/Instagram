//
//  TableViewCellFollowing.swift
//  Instagram
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit

class TableViewCellFollowing: UITableViewCell {


    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblNickNameUser: UILabel!
    @IBOutlet weak var lblStateUser: UILabel!
    
    var tools:Tools = Tools()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tools.roundImage(img: imgUser)
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
