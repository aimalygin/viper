//
//  TranslationInteractor.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class TranslationInteractor: TranslationInteractorProtocol {
    
    weak var presenter: TranslationPresenterProtocol!
    
    let networkService: NetworkServiceProtocol
    let storageService: StorageServiceProtocol
    
    var word: String? {
        didSet {
            translate()
        }
    }
    var fromLanguage: Language = Language.ru
    var toLanguage: Language = Language.en
    var translationValue: String?
    
    
    init(presenter: TranslationPresenterProtocol, networkService: NetworkServiceProtocol, storageService: StorageServiceProtocol) {
        self.presenter = presenter
        self.networkService = networkService
        self.storageService = storageService
    }
    
    func swap() {
        let from = fromLanguage
        let to = toLanguage
        toLanguage = from
        fromLanguage = to
        
        let w = word
        let t = translationValue
        
        word = t
        translationValue = w
        
        translate()
    }
    
    func translate() {
        guard let word = word else {
            return
        }
        
        let request = TranslationRequest(word: word, from: fromLanguage, to: toLanguage)
        networkService.translate(request: request) { [weak self] (result) in
            
            if let translationValue = result,
                let word = self?.word,
                let from = self?.fromLanguage,
                let to = self?.toLanguage {
                
                let item = TranslationItem(word: word,
                                           translationValue: translationValue,
                                           fromLanguage: from,
                                           toLanguage: to)
                
                DispatchQueue.main.async {
                    
                    self?.storageService.add(item: item)
                    
                    if word == request.word &&
                        from == request.from &&
                        to == request.to {
                        
                        self?.translationValue = translationValue
                        self?.presenter.updateTranslationValue()
                    }
                    self?.presenter.itemsListHasBeenUpdated()
                }
            }
        }
    }
    
    func set(language: SelectedLanguage) {
        switch language.type {
        case .from:
            if toLanguage == language.value {
                toLanguage = fromLanguage
            }
            fromLanguage = language.value
        case .to:
            if fromLanguage == language.value {
                fromLanguage = toLanguage
            }
            toLanguage = language.value
        }
        translate()
    }
    
    func set(item: TranslationItem) {
        word = item.word
        translationValue = item.translationValue
        fromLanguage = item.fromLanguage
        toLanguage = item.toLanguage
        
        presenter.updateTranslationValue()
    }
    
}
