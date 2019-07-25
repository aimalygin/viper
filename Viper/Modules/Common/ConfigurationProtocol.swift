//
//  ConfigurationProtocol.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

protocol ConfiguratorProtocol {
    associatedtype CommonViewController
    func configure(with viewController: CommonViewController)
}
