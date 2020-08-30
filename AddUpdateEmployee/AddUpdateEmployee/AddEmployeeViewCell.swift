//
//  AddEmployeeViewCell.swift
//  AddUpdateEmployee
//
//  Created by Meet Patel on 25/Aug/18.
//  Copyright © 2018 Meet Patel. All rights reserved.
//

import UIKit

class AddEmployeeViewCell: UITableViewCell {

    @IBOutlet weak var txtfieldId:UITextField!
    @IBOutlet weak var txtfieldValue:UITextField!
    @IBOutlet weak var btnaddemployee:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
