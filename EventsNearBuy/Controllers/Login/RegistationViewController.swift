//
//  RegistationViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 17/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class RegistationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    fileprivate let kNameTextFieldTag = 101
    fileprivate let kEmailTextFieldTag = 102
    fileprivate let kPasswordTextFieldTag = 103
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        nameView.roundCorners(5.0)
        emailView.roundCorners(5.0)
        passwordView.roundCorners(5.0)
        
        signUpButton.roundCorners(5.0)
    }
    
    private func validateFields() -> Bool {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if name == "" {
            showError("Name field cannot be empty")
            return false
        }
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if email == "" {
            showError("Email field cannot be empty")
            return false
        } else if email.isValidEmail() == false {
            showError("Invalid user name")
            return false
        }
        
        if passwordTextField.text == "" {
            showError("Password field cannot be empty")
            return false
        }
        
        return true
    }
    
    private func showError(_ message:String) {
        let errorVC = UIAlertController(title: message, message: "", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        errorVC.addAction(okayAction)
        
        DispatchQueue.main.async {
            self.present(errorVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func signUpTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        
        if validateFields() {
            if DataAccessor.shared.checkIfUserExist(emailTextField.text!) {
                showError("Email id is already taken.")
            } else {
                let params:[String:Any] = [
                    "name"      :   nameTextField.text!,
                    "email"     :   emailTextField.text!,
                    "password"  :   passwordTextField.text!
                ]
                DataAccessor.shared.setupUser(details: params)
                AppPreferences.userLoggedIn(userID: emailTextField.text!)
                
                HelperFunctions.setAppRootViewController()
            }
        }

    }
    
}

extension RegistationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == kNameTextFieldTag {
            nameTextField.becomeFirstResponder()
        } else if textField.tag == kEmailTextFieldTag {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            return false
        } else if textField.tag != kNameTextFieldTag && string == " " {
            return false
        }
        return true
    }
    
}
