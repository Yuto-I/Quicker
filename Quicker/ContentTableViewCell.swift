//
//  ContentTableViewCell.swift
//  Quicker
//
//  Created by 飯田悠斗 on 16/12/2017.
//  Copyright © 2017 Meeeesi. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var inputDateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
