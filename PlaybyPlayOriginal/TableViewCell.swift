//
//  TableViewCell.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 28/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var yearlabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
