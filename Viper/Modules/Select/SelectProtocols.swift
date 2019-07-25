//
//  SelectProtocols.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation


protocol SelectViewProtocol: class {
    
}

protocol SelectInteractorProtocol {
    
}

protocol SelectRouterProtocol {
    func select(language: SelectedLanguage)
    func closeController()
}

protocol SelectPresenterProtocol: class {
    func choose(language: Language)
    func closeButtonTouched()
    var selectedLanguage: SelectedLanguage? { get set }
    var languageSetter: LanguageSetterProtocol? { get set }
}
