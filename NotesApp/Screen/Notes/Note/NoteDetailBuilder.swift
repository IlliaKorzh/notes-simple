//
//  NoteDetailBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit
import Moya

class NoteDetailBuilder: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        guard let viewController = viewController as? NoteDetailViewController
        else { fatalError() }

        viewController.bind(
            viewModel: NoteDetailViewModel(
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
