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
    
    @IBOutlet private weak var notesContainerView: UIView!
    @IBOutlet private weak var authContainerView: UIView!
    
    // MARK: - LifeCycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.notesContainerView.layer.opacity = self.flow.map { flow in
                    switch flow {
                    case .auth: return 0
                    case .notes: return 1
                    }
                }
                
                self.authContainerView.layer.opacity = self.flow.map { flow in
                    switch flow {
                    case .notes: return 0
                    case .auth: return 1
                    }
                }
            },
            completion: { _ in
                self.notesContainerView.isHidden = self.flow.map { flow in
                    flow == .auth
                }
                
                self.authContainerView.isHidden = self.flow.map { flow in
                    flow == .notes
                }
            })
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
