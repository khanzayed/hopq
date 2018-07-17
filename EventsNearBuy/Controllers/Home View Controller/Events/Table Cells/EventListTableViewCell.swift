//
//  EventListTableViewCell.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {

    @IBOutlet weak var eventBackgroundView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLbl: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventDateLbl: UILabel!
    
    var event:Events! {
        didSet {
            self.eventImageView.image = UIImage(named: event.image!)
            self.eventNameLbl.text = event.name
            self.eventDescription.text = event.details
            self.eventDateLbl.text = ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventBackgroundView.roundCorners(10.0)        
        eventImageView.roundCorners([.bottomLeft, .topLeft], radius: 10.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
