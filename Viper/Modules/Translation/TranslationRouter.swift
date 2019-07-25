//
//  TranslationRouter.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation
import UIKit

class TranslationRouter: TranslationRouterProtocol {
    
    weak var viewController: TranslationViewController!
    
    init(viewController: TranslationViewController) {
        self.viewController = viewController
    }
    
    func updateHistoryList() {
        if let navigationController = viewController.tabBarController?.viewControllers?[1] as? UINavigationController,
            let historyController = navigationController.topViewController as? HistoryViewProtocol {
            
            historyController.updateItems()
        }
    }
    
    func showSelectLanguageView(_ lang: SelectedLanguage) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "select-language-view") as! UINavigationController
        if let selectViewController = vc.topViewController as? SelectViewController {
            
            selectViewController.configurator = SelectConfigurator()
            selectViewController.configurator.configure(with: selectViewController)
            selectViewController.presenter.selectedLanguage = lang
            selectViewController.presenter.languageSetter = viewController.presenter
            
            viewController.present(vc, animated: true, completion: nil)
        }
        
    }
}
