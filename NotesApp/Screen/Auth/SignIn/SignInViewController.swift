//
//  ViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 09.09.2021.
//

import UIKit

class SignInViewController: ViewController<SignInViewModel> {
    
    //MARK: - Outlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    //MARK: - Actions
    @IBAction func signInTouchUpInside(_ sender: Any) {
        
        guard
            let email = email.text,
            let password = password.text,
            email.isEmpty == false,
            password.isEmpty == false
        else { return}
        
        viewModel.signIn(email: email, password: password)
    }
}
