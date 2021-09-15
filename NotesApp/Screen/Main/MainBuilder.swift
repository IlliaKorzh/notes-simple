//
//  MainBuilder.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class MainBuilder: NSObject {
    @IBOutlet weak var viewController: ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.bind(viewModel: MainViewModel())
    }
}
