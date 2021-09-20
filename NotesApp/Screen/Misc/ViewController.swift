//
//  ViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class ViewController<VM: ViewModel>: UIViewController {

    var viewModel: VM!
}

extension ViewController where VM.ViewController: ViewController {
    
    func bind(viewModel: VM) {
        self.viewModel = viewModel
        viewModel.bind(viewController: self)
    }
}
