//
//  SelectPresenter.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class SelectPresenter: SelectPresenterProtocol {
    
    weak var view: SelectViewProtocol!
    var interactor: SelectInteractorProtocol!
    var router: SelectRouterProtocol!
    
    var selectedLanguage: SelectedLanguage?
    
    weak var languageSetter: LanguageSetterProtocol?
    
    init(view: SelectViewProtocol) {
        self.view = view
    }
    
    func choose(language: Language) {
        if var selectedLanguage = selectedLanguage {
            selectedLanguage.value = language
            router.select(language: selectedLanguage)
            router.closeController()
        }
    }
    
    func closeButtonTouched() {
        router.closeController()
    }
}
