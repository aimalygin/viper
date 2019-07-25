//
//  SecondViewController.swift
//  Viper
//
//  Created by Антон Малыгин on 24/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController, HistoryViewProtocol {
    typealias ConfiguratorProtocol = HistoryConfigurator
    
    var presenter: HistoryPresenterProtocol!
    var configurator: ConfiguratorProtocol = HistoryConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50;
        configurator.configure(with: self)
    }

    func updateItems() {
        tableView.reloadData()
    }
    @IBAction func clearButtonTouched(_ sender: Any) {
        presenter.clearButtonTouched()
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        let item = presenter.items[indexPath.row]
        configureCell(cell, with: item)
        return cell
    }
    
    func configureCell(_ cell: HistoryTableViewCell, with item: TranslationItem) {
        cell.item = item
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.didSelect(item: presenter.items[indexPath.row])
    }

}

