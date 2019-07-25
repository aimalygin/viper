//
//  SelectInteractor.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation


class SelectInteractor: SelectInteractorProtocol {
    weak var presenter: SelectPresenterProtocol!
    
    init(presenter: SelectPresenterProtocol) {
        self.presenter = presenter
    }
}
