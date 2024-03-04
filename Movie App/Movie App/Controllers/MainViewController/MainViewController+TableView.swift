//
//  MainViewController+TableView.swift
//  Movie App
//
//  Created by BJIT on 8/12/23.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.backgroundColor = .clear
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    

}
