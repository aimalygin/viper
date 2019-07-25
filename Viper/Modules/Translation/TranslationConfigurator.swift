//
//  TranslationConfigurator.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class TranslationConfigurator: ConfiguratorProtocol {
    func configure(with viewController: TranslationViewController) {
        
        let network = NetworkService()
        let storage = StorageService()
        
        let presenter = TranslationPresenter(view: viewController)
        let interactor = TranslationInteractor(presenter: presenter, networkService: network, storageService: storage)
        let router = TranslationRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
