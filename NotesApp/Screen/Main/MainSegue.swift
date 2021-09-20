//
//  MainSegue.swift
//  NotesApp
//
//  Created by dlisovoy on 20.09.2021.
//

import UIKit

class MainSegue: UIStoryboardSegue {
    
    override func perform() {
        destination.willMove(toParent: source)
        destination.view.layer.opacity = 0
        source.view.addSubview(destination.view)
        destination.view.frame = source.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.destination.view.layer.opacity = 1
        }
        source.addChild(destination)
        destination.didMove(toParent: source)
    }
}
