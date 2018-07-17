//
//  EventCategoryCollectionViewCell.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class EventCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    var category:Categories! {
        didSet {
            self.categoryNameLbl.text = category.name
            self.categoryImageView.image = UIImage(named: category.image!)
        }
    }
    
    override func awakeFromNib() {
        categoryImageView.roundCorners(10.0)
        
        categoryNameLbl.text = "Outdoors"
        categoryImageView.image = UIImage(named: "ic_beach")
    }
    
}
