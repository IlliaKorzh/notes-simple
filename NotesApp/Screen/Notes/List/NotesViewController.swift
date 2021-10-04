//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class NotesViewController: ViewController<NotesViewModel> {
    
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
        configuration.text = viewModel.notes[indexPath.item].title
        configuration.secondaryText = viewModel.notes[indexPath.item].subtitle
        cell.contentConfiguration = configuration
        return cell
    }
}
