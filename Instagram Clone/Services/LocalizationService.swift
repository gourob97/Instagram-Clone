//
//  LocalizationService.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 1/6/24.
//

import Foundation

class LocalizationService {
    static let shared = LocalizationService()
    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english
            }
            return Language(rawValue: languageString) ?? .english
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
            }
        }
    }
}
