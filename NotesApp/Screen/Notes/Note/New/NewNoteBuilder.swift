//
//  NewNoteBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import Foundation
import Moya

class NewNoteBuilder: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        guard let viewController = viewController as? NoteViewController
        else { fatalError() }

        viewController.bind(
            viewModel: NewNoteViewModel(
                api: API(
                    provider: MoyaProvider(
                        plugins: [
                            AccessTokenPlugin(tokenClosure: { target in TokenHolder.shared.token ?? "" })
                        ]
                    )
                ), dataBase: .init(core: DataBase.sharedCore)
            )
        )
    }
}
