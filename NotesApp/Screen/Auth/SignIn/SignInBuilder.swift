//
//  SignInBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import UIKit

class SignInBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let viewController = viewController as? SignInViewController
        else { fatalError() }
        
        viewController.bind(
            viewModel: SignInViewModel(
                api: API(provider: .init())
            )
        )
    }
}
