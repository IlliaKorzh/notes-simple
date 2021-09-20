import UIKit
import Moya

class NotesBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let viewController = viewController as? NotesViewController
        else { fatalError() }
        
        viewController.bind(
            viewModel: NotesViewModel(
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
