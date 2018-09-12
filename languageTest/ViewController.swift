//
//  ViewController.swift
//  languageTest
//
//  Created by otc on 2018/9/12.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit

let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    let languageLabel: UILabel  = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private var switchButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        configTestView()
    }
    
    // 配置UI
    func configTestView() {
        languageLabel.frame = CGRect(x: 0, y: 100, width: SCREEN_WIDTH, height: 20)
        languageLabel.text = keyString.common.testBtnTitle.commonStr()
        self.view.addSubview(languageLabel)
        
        switchButton.frame = CGRect(x: 0, y: 130, width: SCREEN_WIDTH, height: 30)
        switchButton.setTitle(keyString.common.switchButton.commonStr(), for: .normal)
        switchButton.setTitleColor(UIColor.red, for: .normal)
        switchButton.addTarget(self, action: #selector(switchButtonClick), for: .touchUpInside)
        self.view.addSubview(switchButton)
    }
    
    @objc
    func switchButtonClick() {
        if  LanguageLocalized.isChinese {
            LanguageLocalized.shared.setLanguage("en")
        } else {
            LanguageLocalized.shared.setLanguage("zh-Hans")
        }
        refeshContent()
    }
    
    // refresh
    func refeshContent() {
        
        languageLabel.text = keyString.common.testBtnTitle.commonStr()
        switchButton.setTitle(keyString.common.switchButton.commonStr(), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

