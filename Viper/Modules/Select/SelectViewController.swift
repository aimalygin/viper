//
//  SelectViewController.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import UIKit

class SelectViewController: UITableViewController, SelectViewProtocol {
    
    typealias ConfiguratorProtocol = SelectConfigurator
    
    var presenter: SelectPresenterProtocol!
    var configurator: ConfiguratorProtocol = SelectConfigurator()
    
    let languages: [Language] = Language.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50;
    }
    
    func updateItems() {
        tableView.reloadData()
    }
    @IBAction func closeButtonTouched(_ sender: Any) {
        presenter.closeButtonTouched()
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedLangCell", for: indexPath)
        let lang = languages[indexPath.row]
        configureCell(cell, with: lang)
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, with lang: Language) {
        cell.textLabel?.text = lang.description
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let lang = languages[indexPath.row]
        presenter.choose(language: lang)
    }
    
}
