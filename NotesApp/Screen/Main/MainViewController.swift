//
//  MainViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

extension MainViewController {
    
    enum Flow: Equatable {
        case auth, notes
        
        func map<T>(_ transform: (Flow) -> T) -> T {
            transform(self)
        }
    }
}

class MainViewController: ViewController<MainViewModel> {
    
    var flow: Flow = .auth {
        didSet {
            guard isViewLoaded else { return }
            view.setNeedsLayout()
        }
    }
    
    private var auth: UIViewController?
    private var notes: UIViewController?
    
    // MARK: - LifeCycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        switch flow {
        case .auth where auth?.parent != self:
            self.children.forEach { viewController in
                viewController.willMove(toParent: nil)
                viewController.removeFromParent()
                viewController.view.removeFromSuperview()
                viewController.didMove(toParent: nil)
            }
            performSegue(withIdentifier: "com.segue.auth", sender: self)
            
        case .notes where notes?.parent != self:
            self.children.forEach { viewController in
                viewController.willMove(toParent: nil)
                viewController.removeFromParent()
                viewController.view.removeFromSuperview()
                viewController.didMove(toParent: nil)
            }
            performSegue(withIdentifier: "com.segue.notes", sender: self)
        
        default:
            break
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "com.segue.notes":
            notes = segue.destination
        case "com.segue.auth":
            auth = segue.destination
        default:
            break
        }
    }
}
