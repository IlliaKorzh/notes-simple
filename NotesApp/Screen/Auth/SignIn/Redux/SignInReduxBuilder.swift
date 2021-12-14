//
//  SignInReduxBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 08.12.2021.
//

import UIKit

class SignInReduxBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let viewController = viewController as? SignInReduxViewController
        else { fatalError() }

        viewController.bind(
            viewModel: SignInReduxViewModel(
                store: App.store
            )
        )
    }
}
