//
//  ProfileHomeViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class ProfileHomeViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var editPasswordButton: UIButton!
    @IBOutlet weak var switchNotificationsButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    @IBOutlet weak var signOutButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = DataAccessor.shared.loggedInUser
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        nameLbl.text = user.name ?? ""
        emailLbl.text = user.email ?? ""
        notificationSwitch.isOn = user.notificationStatus.boolValue
        
        signOutButton.roundCorners(5.0)
    }

    
    @IBAction func signOutTapped(_ sender: UIButton) {
        AppPreferences.userLoggedOut()
        DataAccessor.shared.deleteUser()
        HelperFunctions.resetRootViewController()
    }
    
    @IBAction func editPasswordTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func switchotificationsTapped(_ sender: UIButton) {
        if notificationSwitch.isOn {
            notificationSwitch.isOn = false
            user.notificationStatus = NSNumber(value: notificationSwitch.isOn)
        } else {
            notificationSwitch.isOn = true
            user.notificationStatus = NSNumber(value: notificationSwitch.isOn)
        }
        
        DataAccessor.shared.save()
    }
    
    @IBAction func privacyPolicyTapped(_ sender: UIButton) {
        
    }

}
