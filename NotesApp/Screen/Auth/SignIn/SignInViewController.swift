//
//  ViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 09.09.2021.
//

import UIKit
import Moya

class SignInViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    let manager = APIManager()
    
    
 //check how works request
    @IBAction func didTapContinue(_sender: Any){
        
        let userEmail = email.text 
        let userPassword = password.text
        
        manager.provider.request(.signIn(email: userEmail ?? "", password: userPassword ?? "")) { result in
            switch result {
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

