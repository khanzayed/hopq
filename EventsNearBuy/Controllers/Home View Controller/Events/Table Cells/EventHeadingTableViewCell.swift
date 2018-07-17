//
//  EventHeadingTableViewCell.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class EventHeadingTableViewCell: UITableViewCell {

    @IBOutlet weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showMoreButtonTapped(_ sender: UIButton) {
    }
    
}
