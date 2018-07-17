//
//  CollectionTableViewCell.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    typealias PushViewControllerBlock = (Categories) -> Void
    var pushViewControllerBlock:PushViewControllerBlock?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showMoreButton: UIButton!
    
    var list:[Categories]! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showMoreButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCategoryCollectionViewCell", for: indexPath) as! EventCategoryCollectionViewCell
        cell.category = list[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        let category = list[indexPath.row]
        pushViewControllerBlock?(category)
    }
    
}
