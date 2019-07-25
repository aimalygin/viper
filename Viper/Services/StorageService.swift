//
//  Storage.swift
//  Viper
//
//  Created by Антон Малыгин on 24/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

protocol StorageServiceProtocol {
    func add(item: TranslationItem)
    func clear()
    func fetch() -> [StorageItem]
}

class StorageService: StorageServiceProtocol {
    let coreData = CoreDataManager.instance
    
    func add(item: TranslationItem) {
        coreData.add(translation: item)
    }
    
    func clear() {
        coreData.clear()
    }
    
    func fetch() -> [StorageItem] {
        return coreData.fetch()
    }
}
