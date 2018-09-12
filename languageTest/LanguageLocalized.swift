//
//  LanguageLocalized.swift
//  languageTest
//
//  Created by otc on 2018/9/12.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit

let appLanguage = "appLanguage"

enum Language: Int {
    case Chinese = 0
    case English
    
    public func getShorthand() -> String {
        var shorthand = "zh-Hans"
        switch self {
        case .Chinese:
            shorthand = "zh-Hans"
        case .English:
            shorthand = "en"
        }
        return shorthand
    }
}

class LanguageLocalized: NSObject {
    
    static let shared = LanguageLocalized()
    
    func initLangeuage() {
        let language: String = currentLanguage()
        if language.count > 0  {
            print("自设置语言:\(language)")
        } else {
            systemLanguage()
        }
    }
    
    func currentLanguage() -> String {
        let language = UserDefaults.standard.object(forKey: appLanguage)
        if language is String {
            return language as! String
        }
        return  ""
    }
    
    /// 是否是中文
    static var isChinese: Bool {
        return LanguageLocalized.shared.currentLanguage() == Language.Chinese.getShorthand()
    }
    
    func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: appLanguage)
        UserDefaults.standard.synchronize()
    }
    
    func systemLanguage() {
        let languageS: Array<String> = UserDefaults.standard.object(forKey: "AppleLanguages") as! Array
        var languageCode: NSString = languageS.first! as NSString
        if languageCode.hasPrefix("zh-Hans") {
            languageCode = "zh-Hans" //简体中文
        } else if languageCode.hasPrefix("en") {
            languageCode = "en" //英文
        } else {
            languageCode = "zh-Hans" //简体中文
        }
        setLanguage(languageCode as String)
    }
}
