//
//  NoteDetailBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit
import Moya

class EditNoteBuilder: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        guard let viewController = viewController as? NoteViewController
        else { fatalError() }

        viewController.bind(
            viewModel: EditNoteViewModel(
                id: "",
                api: API(
                    provider: MoyaProvider(
                        plugins: [
                            AccessTokenPlugin(tokenClosure: { target in TokenHolder.shared.token ?? "" })
                        ]
                    )
                )
            )
        )
    }
}
