//
//  HistoryPresenter.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol {
    weak var view: HistoryViewProtocol!
    var interactor: HistoryInteractorProtocol!
    var router: HistoryRouterProtocol!
    
    var items: [TranslationItem] {
        return interactor.items.compactMap({ (storageItem) -> TranslationItem? in
            guard let word = storageItem.word,
                let translationValue = storageItem.translation,
                let fromLanguageString = storageItem.fromLanguage,
                let toLanguageString = storageItem.toLanguage,
                let fromLanguage = Language(rawValue: fromLanguageString),
                let toLanguage = Language(rawValue: toLanguageString) else {
                
                    return nil
            }
            return TranslationItem(word: word, translationValue: translationValue, fromLanguage: fromLanguage, toLanguage: toLanguage)
        }).reversed()
    }
    
    init(view: HistoryViewProtocol) {
        self.view = view
    }
    
    func didSelect(item: TranslationItem) {
        router.show(item: item)
    }
    
    func clearButtonTouched() {
        interactor.clearList()
        view.updateItems()
    }
    
}
