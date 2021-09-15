//
//  ViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class ViewController/*<VM: ViewModel>*/: UIViewController {

    private var viewModel: ViewModel!
}

extension ViewController /*where VM.ViewController == ViewController*/ {
    
    func bind(viewModel: ViewModel) {
        self.viewModel = viewModel
        viewModel.bind(viewController: self)
    }
}
