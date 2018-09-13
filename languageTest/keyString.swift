//
//  keyString.swift
//  languageTest
//
//  Created by otc on 2018/9/12.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import Foundation
enum keyString {
    enum common: String {
        case success = "success"
        case testBtnTitle = "testBtnTitle"
        case switchButton = "switchButton"
        
        func commonStr() -> String {
            return getLang(string: self.rawValue)
        }
    }
    
    enum moduleOne: String {
        case success = "success"
        case testBtnTitle = "testBtnTitle"
        case switchButton = "switchButton"
        
        func moduleOneStr() -> String {
            return getLang(string: self.rawValue)
        }
    }
}



func getLang(string: String) -> String {
    return  getLanguageValue(string, comment:"")
}

//  中文 zh-Hans 英文 en
func getLanguageValue(_ key: String, comment: String) -> String {
    print(key)
    return (Bundle.init(path: Bundle.main.path(forResource: String(format: "%@", UserDefaults.standard.object(forKey: appLanguage) as! CVarArg), ofType: "lproj")!)?.localizedString(forKey: key, value: "", table: nil))!
}
