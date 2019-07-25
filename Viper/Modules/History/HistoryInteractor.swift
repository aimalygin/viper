//
//  HistoryInteractor.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class HistoryInteractor: HistoryInteractorProtocol {
    
    weak var presenter: HistoryPresenterProtocol!
    let storageService: StorageServiceProtocol
    
    var items: [StorageItem] {
        return storageService.fetch()
    }
    
    init(presenter: HistoryPresenterProtocol, storageService: StorageServiceProtocol) {
        self.presenter = presenter
        self.storageService = storageService
    }
    
    func clearList() {
        storageService.clear()
    }
}
