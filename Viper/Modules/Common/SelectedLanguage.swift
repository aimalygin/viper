//
//  SelectedLanguage.swift
//  Viper
//
//  Created by Антон Малыгин on 26/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

enum LanguageType {
    case from
    case to
}

struct SelectedLanguage {
    var value: Language
    let type: LanguageType
}
