//
//  SignUpBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit

class SignUpBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let viewController = viewController as? SignUpViewController
        else { fatalError() }
        
        viewController.bind(
            viewModel: SignUpViewModel(
                api: API(provider: .init())
            )
        )
    }
}
