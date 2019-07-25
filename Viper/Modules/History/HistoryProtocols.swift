//
//  HistoryProtocols.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

protocol HistoryViewProtocol: class {
    func updateItems()
}

protocol HistoryInteractorProtocol {
    var items: [StorageItem] { get }
    func clearList()
}

protocol HistoryRouterProtocol {
    func show(item: TranslationItem)
}

protocol HistoryPresenterProtocol: class {
    var items: [TranslationItem] { get }
    func didSelect(item: TranslationItem)
    func clearButtonTouched()
}
