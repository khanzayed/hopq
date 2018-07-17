//
//  EventDetailsViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 17/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var descriptionLblHeightConstraint: NSLayoutConstraint! // 20
    @IBOutlet weak var eventNameLbl: UILabel!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var dislikeLbl: UILabel!
    
    var event:Events!
    var category:Categories!
    var fullTextHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        category = DataAccessor.shared.fetchCategory(event.categoryID)[0]
        setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        eventNameLbl.text = event.name ?? ""
        eventImageView.image = UIImage(named: event.image!)
        priceLbl.text = event.price ?? ""
        
        let favImage = (event.isFavourite.boolValue) ? UIImage(named: "is_favourite_gold") : UIImage(named: "ic_favourite_new")
        favouriteButton.setImage(favImage, for: .normal)
        
        if event.isLiked == true {
            likeLbl.text = "Liked"
            likeLbl.textColor = AppColors.primaryColor
        }
        
        if event.isDisliked == true {
            dislikeLbl.text = "Disliked"
            dislikeLbl.textColor = AppColors.primaryColor
        }
        
        categoryView.roundCorners(4.0)
        
        fullTextHeight = descriptionLbl.text!.height(constraintedWidth: UIScreen.main.bounds.width -  40, font: UIFont(name: "Times New Roman", size: 15)!)
        
        if fullTextHeight > 60 {
            descriptionLblHeightConstraint.constant = 60
            readMoreButton.isHidden = false
        } else {
            descriptionLblHeightConstraint.constant = fullTextHeight
            readMoreButton.isHidden = true
        }
        
        let width = category.name!.widthForSingleRow(font: UIFont(name: "Times New Roman", size: 15)!)
        let categoryLbl = UILabel(frame: CGRect(x: 10, y: 0, width: width, height: 30))
        categoryLbl.font = UIFont(name: "Times New Roman", size: 15)
        categoryLbl.numberOfLines = 1
        categoryLbl.textColor = .white
        categoryLbl.text = category.name ?? ""
        
        let categoryBackView = UIView(frame: CGRect(x: 0, y: 0, width: categoryLbl.bounds.width + 20, height: 30))
        categoryBackView.backgroundColor = AppColors.primaryColor
        categoryBackView.roundCorners(5.0)
        
        categoryBackView.addSubview(categoryLbl)
        categoryView.addSubview(categoryBackView)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
        if descriptionLblHeightConstraint.constant >  60 {
            UIView.animate(withDuration: 0.3, animations: {
                self.descriptionLblHeightConstraint.constant = 60
                self.view.layoutIfNeeded()
            }) { (true) in
                self.readMoreButton.setTitle("more", for: .normal)
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.descriptionLblHeightConstraint.constant = self.fullTextHeight
                self.view.layoutIfNeeded()
            }) { (true) in
                self.readMoreButton.setTitle("less", for: .normal)
            }
        }
    }
    
    @IBAction func sharedButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if event.isLiked.boolValue == false {
            dislikeLbl.text = "Dislike"
            dislikeLbl.textColor = AppColors.grayColor
            
            likeLbl.text = "Liked"
            likeLbl.textColor = AppColors.primaryColor
            
            event.liked()
            DataAccessor.shared.save()
        }
    }
    
    @IBAction func dislikeButtonTapped(_ sender: UIButton) {
        if event.isDisliked.boolValue == false {
            likeLbl.text = "Like"
            likeLbl.textColor = AppColors.grayColor
            
            dislikeLbl.text = "Disliked"
            dislikeLbl.textColor = AppColors.primaryColor
            
            event.disliked()
            DataAccessor.shared.save()
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        (event.isFavourite.boolValue) ? event.removeFromFavourites() : event.addToFavourites()
        
        let favImage = (event.isFavourite.boolValue) ? UIImage(named: "is_favourite_gold") : UIImage(named: "ic_favourite_new")
        favouriteButton.setImage(favImage, for: .normal)
        
        DataAccessor.shared.save()
    }
    
}
