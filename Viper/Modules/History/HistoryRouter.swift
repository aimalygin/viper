//
//  HistoryRouter.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class HistoryRouter: HistoryRouterProtocol {
    weak var viewController: HistoryViewController!
    
    init(viewController: HistoryViewController) {
        self.viewController = viewController
    }
    
    func show(item: TranslationItem) {
        if let translationController = viewController.tabBarController?.viewControllers?[0] as? TranslationViewProtocol {
            translationController.presenter.set(item: item)
            viewController.tabBarController?.selectedIndex = 0
        }
    }
}
