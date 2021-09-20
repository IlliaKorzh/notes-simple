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
    
    
//    var signInViewModel: SignInViewModel {
//        viewModel as! SignInViewModel
//    }
    
  //MARK: - Actions
 //check how works request
    @IBAction func didTapContinue(_sender: Any){
        
        let userEmail = email.text 
        let userPassword = password.text
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
}

