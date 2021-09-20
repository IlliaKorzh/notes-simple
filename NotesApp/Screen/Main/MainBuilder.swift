//
//  MainBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class MainBuilder: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let mainViewController = viewController as? MainViewController
        else { fatalError() }
        
        mainViewController.bind(viewModel: MainViewModel())
    }
}
