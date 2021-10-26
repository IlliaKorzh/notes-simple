//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class NotesViewController: ViewController<NotesViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(refresh),
            for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        viewModel.logout()
    }
    
    @objc func refresh() {
        viewModel.reloadData()
    }
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.notes.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "com.cells.notes",
            for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: viewModel.notes[indexPath.item].date!)
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+6")// GMT+3
        let resultTime = dateFormatter.string(from: date!)
        
        configuration.text = viewModel.notes[indexPath.item].title
        configuration.secondaryText = resultTime + "\n" + viewModel.notes[indexPath.item].subtitle!
        
        cell.contentConfiguration = configuration
        return cell
    }
}
