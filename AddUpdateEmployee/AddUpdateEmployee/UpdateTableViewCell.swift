//
//  UpdateTableViewCell.swift
//  AddUpdateEmployee
//
//  Created by Meet Patel on 27/Aug/18.
//  Copyright © 2018 Meet Patel. All rights reserved.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtfieldfname:UITextField!
    @IBOutlet weak var txtfieldlname:UITextField!
    @IBOutlet weak var txtfielddesignation:UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
