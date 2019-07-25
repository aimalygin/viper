//
//  TranslationProtocols.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation
import UIKit

protocol TranslationViewProtocol: class {
    func show(item: TranslationItem)
    func updateButtons()
    
    var presenter: TranslationPresenterProtocol! { get }
}

protocol TranslationInteractorProtocol {
    func translate()
    
    var word: String? { get set }
    var fromLanguage: Language { get }
    var toLanguage: Language { get }
    var translationValue: String? { get }
    
    func set(language: SelectedLanguage)
    func set(item: TranslationItem)
    
    func swap()
}

protocol TranslationRouterProtocol {
    func updateHistoryList()
    func showSelectLanguageView(_ lang: SelectedLanguage)
}

protocol TranslationPresenterProtocol: LanguageSetterProtocol {
    
    func itemsListHasBeenUpdated()
    
    func updateTranslationValue()
    
    func swapButtonTouched()
    
    func setWord(_ value: String)
        
    var fromLanguageTitle: String { get }
    var toLanguageTitle: String { get }
    
    func fromLangButtonTouched()
    func toLangButtonTouched()
    
    func set(item: TranslationItem)
}

protocol LanguageSetterProtocol: class {
    func set(language: SelectedLanguage)
}
