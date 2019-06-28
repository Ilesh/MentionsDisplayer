//
//  ProfessionalCell.swift
//  MentionsDisplayer
//
//  Created by macmini on 05/05/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class ProfessionalCell: DropDownCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
