//
//  SignUpViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class SignUpViewController<ViewModel: SignUpProtocol>: ViewController<ViewModel> {

    // MARK: - Outlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Action

    @IBAction func signUpTouchUpInside(_ sender: Any) {
        
        guard
            let email = email.text,
            let password = password.text,
            email.isEmpty == false,
            password.isEmpty == false
        else { return}
        
        viewModel.signUp(email: email, password: password)
    }
}
