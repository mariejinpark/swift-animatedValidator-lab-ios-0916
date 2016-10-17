//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    var fields:[UITextField]!
    var counter = 0
    var redColor = UIColor.red
    var whiteColor = UIColor.white
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = whiteColor
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
        fields = [emailTextField, emailConfirmationTextField, phoneTextField, passwordTextField, passwordConfirmTextField]
        
        for field in fields {
            field.backgroundColor = whiteColor
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func animate(textfield: UITextField){
      UIView.animateKeyframes(withDuration: 0.8, delay: 0.0, options: [.autoreverse], animations: {
        textfield.backgroundColor = UIColor.red
        textfield.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: nil)
    }
    
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func emailTapped(_ sender: UITextField) {
        guard let email = emailTextField.text, email != "" else {
            print ("not a valid email address")
            return
        }
        
        if emailTextField.text!.contains("@") {
            counter += 1
            emailTextField.backgroundColor = whiteColor
            self.emailTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } else {
            animate(textfield: emailTextField)
        }
        
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func emailConfirmTapped(_ sender: UITextField) {
        guard let emailConfirm = emailConfirmationTextField.text, emailConfirm != "" else {
            print ("email addresses do not match")
            return
        }
        
            if emailConfirmationTextField.text == emailTextField.text {
                counter += 1
                emailConfirmationTextField.backgroundColor = whiteColor
                self.emailConfirmationTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            } else {
                animate(textfield: emailConfirmationTextField)
            }
            
            if counter == 5 {
                submitButton.isEnabled = true
            }
    }

    @IBAction func phoneTapped(_ sender: UITextField) {
        guard let phone = phoneTextField.text, phone != "" else {
            print ("please enter a valid number")
            return
        }
        
        let phoneCharacters = Array(phoneTextField.text!.characters)
        let phoneCount = phoneCharacters.count
        
        if  phoneCount >= 7 {
            counter += 1
            phoneTextField.backgroundColor = whiteColor
            phoneTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        } else {
            animate(textfield: phoneTextField)
        }
        
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func passwordTapped(_ sender: UITextField) {
        
        let passwordCharacterArray = Array(passwordTextField.text!.characters)
        let passwordCount = passwordCharacterArray.count
        
        guard let password = passwordTextField.text, password != "" else {
            print("please enter as valid password")
            return
        }
        
        if passwordCount > 6 {
            counter += 1
            passwordTextField.backgroundColor = whiteColor
            passwordTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } else {
             animate(textfield: passwordTextField)
        }
        
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func passwordConfirmTapped(_ sender: UITextField) {
        
        guard let passwordConfirm = passwordConfirmTextField.text, passwordConfirm != "" else {
            print("passwords must match")
            return
        }
        
        if passwordTextField == passwordConfirmTextField {
            counter += 1
            passwordConfirmTextField.backgroundColor = whiteColor
             passwordConfirmTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } else {
             animate(textfield: passwordConfirmTextField)
        }
        
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    
}
