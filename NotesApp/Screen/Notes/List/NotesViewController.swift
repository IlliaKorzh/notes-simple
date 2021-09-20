//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class NotesViewController: ViewController<NotesViewModel> {

    @IBAction func logout(_ sender: UIBarButtonItem) {
        viewModel.logout()
    }
}
