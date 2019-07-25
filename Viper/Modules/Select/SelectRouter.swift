//
//  SelectRouter.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class SelectRouter: SelectRouterProtocol {
    
    weak var viewController: SelectViewController!
    
    init(viewController: SelectViewController) {
        self.viewController = viewController
    }
    
    func select(language: SelectedLanguage) {
        viewController.presenter.languageSetter?.set(language: language)
    }
    
    func closeController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
