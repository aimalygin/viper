//
//  TranslationPresenterProtocol.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class TranslationPresenter: TranslationPresenterProtocol, LanguageSetterProtocol {
    
    weak var view: TranslationViewProtocol!
    var interactor: TranslationInteractorProtocol!
    var router: TranslationRouterProtocol!
    
    init(view: TranslationViewProtocol) {
        self.view = view
    }
    
    var fromLanguageTitle: String {
        return interactor.fromLanguage.description
    }
    
    var toLanguageTitle: String {
        return interactor.toLanguage.description
    }
    
    func setWord(_ value: String) {
        interactor.word = value
    }
    
    func swapButtonTouched() {
        interactor.swap()
        view.updateButtons()
    }
    
    func translate() {
        interactor.translate()
    }
    
    func updateTranslationValue() {
        guard let translationValue = interactor.translationValue,
            let word = interactor.word else { return }
        
        view.show(item: TranslationItem(word: word, translationValue: translationValue, fromLanguage: interactor.fromLanguage, toLanguage: interactor.toLanguage))
    }
    
    func itemsListHasBeenUpdated() {
        router.updateHistoryList()
    }
    
    func fromLangButtonTouched() {
        router.showSelectLanguageView(SelectedLanguage(value: interactor.fromLanguage, type: .from))
    }
    
    func toLangButtonTouched() {
        router.showSelectLanguageView(SelectedLanguage(value: interactor.toLanguage, type: .to))
    }
    
    func set(language: SelectedLanguage) {
        interactor.set(language: language)
        view.updateButtons()
    }
    
    func set(item: TranslationItem) {
        interactor.set(item: item)
    }
    
}
