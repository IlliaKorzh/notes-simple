//
//  NoteDetailViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit

class NoteViewController: ViewController<NoteViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextView!
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = viewModel.title
        subtitleText.text = viewModel.subtitle
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewModel.title = titleText.text
        viewModel.subtitle = subtitleText.text
//        saveButtonItem.isEnabled = viewModel.save != nil
    }
    
    // MARK: - Actions
    
    @IBAction func saveClick(_ sender: Any) {
        viewModel.save?()
    }
}
