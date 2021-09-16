//
//  MainViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

extension MainViewController {
    
    enum Flow {
        case auth, notes
        
        func map<T>(_ transform: (Flow) -> T) -> T {
            transform(self)
        }
    }
}

@objc class MainViewController: ViewController {
    
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
        UIView.animate(withDuration: 0.3) {
            self.notes.map { viewController in
                viewController.view.layer.opacity = self.flow.map { flow in
                    switch flow {
                    case .auth: return 0
                    case .notes: return 1
                    }
                }
            }
            self.auth.map { viewController in
                viewController.view.layer.opacity = self.flow.map { flow in
                    switch flow {
                    case .notes: return 0
                    case .auth: return 1
                    }
                }
            }
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
