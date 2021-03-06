//
//  ViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

protocol ViewModel {
    associatedtype ViewController: UIViewController
    func bind(viewController: ViewController)
}
