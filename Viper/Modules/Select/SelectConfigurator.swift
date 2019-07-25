//
//  SelectConfigurator.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

class SelectConfigurator: ConfiguratorProtocol {
    func configure(with viewController: SelectViewController) {
        
        let presenter = SelectPresenter(view: viewController)
        let interactor = SelectInteractor(presenter: presenter)
        let router = SelectRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
