//
//  ViewController.swift
//  UIKitLoginMS
//
//  Created by 전민석 on 2023/06/25.
//

// 로그인 창

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var agreeSwitch: UISwitch!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        signInButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
                
        agreeSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        signInButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        updateButtonState()
    }
    
    @objc func buttonTapped() {
        print("버튼이 눌렸음")
    }
    
    func updateButtonState() {
        let emailTextFieldHasText = !emailTextField.text!.isEmpty
        
        let passwordTextFieldHasText = !passwordTextField.text!.isEmpty
        
        let agreeSwitchIsActive = agreeSwitch.isOn
        
        signInButton.isEnabled = emailTextFieldHasText && passwordTextFieldHasText && agreeSwitchIsActive
    }
}
