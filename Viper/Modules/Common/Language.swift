//
//  Language.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

enum Language: String, CaseIterable {
    case ru = "ru"
    case en = "en"
    case es = "es"
    
    func toCode() -> String {
        return self.rawValue
    }
    
    var description: String {
        switch self {
        case .ru: return "Russian"
        case .en: return "English"
        case .es: return "Spanish"
        }
    }
}
