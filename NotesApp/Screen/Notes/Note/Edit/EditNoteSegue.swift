//
//  NoteDetailBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit
import Moya

class EditNoteSegue: UIStoryboardSegue {
    
    override func perform() {
        
        super.perform()
        
        guard
            let noteViewController = destination as? NoteViewController,
            let notesViewController = source as? NotesViewController
        else {
            return assertionFailure(
                """
                This segue can only be used with:
                Destination: NoteViewController
                Source: NotesViewController.
                """)
        }
        
        guard let item = notesViewController.tableView.indexPathForSelectedRow?.item
        else { return assertionFailure("indexPathForSelectedRow nil") }
        
        noteViewController.bind(
            viewModel: EditNoteViewModel(
                id: notesViewController.viewModel.notes[item].id ?? "",
                api: API(
                    provider: MoyaProvider(
                        plugins: [
                            AccessTokenPlugin(tokenClosure: { target in TokenHolder.shared.token ?? "" })
                        ]
                    )
                ),
                dataBase: .init(core: DataBase.sharedCore)
            )
        )
    }
}
