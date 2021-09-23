//
//  NoteDetailViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit

class NoteDetailViewController: ViewController<NoteDetailViewModel> {
    
    var noteDetail: Note?
//MARK: - Outlets
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextView!
    
    
    
    @IBAction func saveClick(_ sender: Any) {
        viewModel.addNote(title: titleText.text ?? "no data was saved", subtitle: subtitleText.text ?? "no data was saved")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = noteDetail?.title
        subtitleText.text = noteDetail?.subtitle
    }
    
}
