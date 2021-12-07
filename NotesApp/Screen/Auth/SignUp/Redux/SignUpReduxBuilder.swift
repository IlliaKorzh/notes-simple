//
//  SignUpReduxBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import UIKit

class SignUpReduxBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let viewController = viewController as? SignUpReduxViewController
        else { fatalError() }

        viewController.bind(
            viewModel: SignUpReduxViewModel(
                store: App.store
            )
        )
    }
}
