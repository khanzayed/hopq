//
//  LoginViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 17/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    fileprivate let kEmailTextFieldTag = 101
    fileprivate let kPasswordTextFieldTag = 102
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        emailView.roundCorners(5.0)
        passwordView.roundCorners(5.0)
        
        signInButton.roundCorners(5.0)
        signUpButton.roundCorners(5.0)
    }
    
    private func validateFields() -> Bool {
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
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if validateFields(), DataAccessor.shared.checIfUserExist(emailTextField.text!, password: passwordTextField.text!) {
            AppPreferences.userLoggedIn(userID: emailTextField.text!)
            
            HelperFunctions.setAppRootViewController()
        } else {
            showError("No such user details exists. Please sign up to continue.")
        }
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == kEmailTextFieldTag {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" && string == " " {
            return false
        }
        return true
    }
    
}
