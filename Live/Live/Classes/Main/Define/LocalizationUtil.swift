//
//  LocalizationUtil.swift
//  Live
//
//  Created by gaoshuang on 2022/5/10.
//

import Foundation

enum Language {
    case english
    case chinese
}

class LocalizationTool {
    
    static let shared = LocalizationTool()
    let KEY = "Localiza_Key"
    let defaults = UserDefaults.standard
    var bundle: Bundle?
    var currentLanguage: Language = .english
    
    func valueWithKey(key: String) -> String {
        let bundle = LocalizationTool.shared.bundle
        if let bundle = bundle {
            return NSLocalizedString(key, tableName: "Localization", bundle: bundle, value: "", comment: "")
        } else {
            return NSLocalizedString(key, comment: "")
        }
    }
    
    func setLanguage(language: Language) {
        if currentLanguage == language {
            return
        }
        switch language {
        case .english:
            defaults.set("en", forKey: KEY)
            break
        case .chinese:
            defaults.set("cn", forKey: KEY)
            break
        }
        currentLanguage = getLanguage()
    }
    
    func checkLanguage() {
        currentLanguage = getLanguage()
    }
    
    private func getLanguage() -> Language {
        var str = ""
        if let language = defaults.value(forKey: KEY) as? String {
            str = language == "cn" ? "zh-Hans" : "en"
        } else {
            str = getSystemLanguage()
        }
        if let path = Bundle.main.path(forResource:str , ofType: "lproj") {
            bundle = Bundle(path: path)
        }
        return str == "en" ? .english : .chinese
    }
    
    private func getSystemLanguage() -> String {
        let preferredLang = Bundle.main.preferredLocalizations.first! as NSString
        switch String(describing: preferredLang) {
        case "en-US", "en-CN":
            return "en"
        case "zh-Hans-US","zh-Hans-CN","zh-Hant-CN","zh-TW","zh-HK","zh-Hans":
            return "zh-Hans"
        default:
            return "en"
        }
    }
}

extension String {
    var localized: String {
        return LocalizationTool.shared.valueWithKey(key: self)
    }
}
