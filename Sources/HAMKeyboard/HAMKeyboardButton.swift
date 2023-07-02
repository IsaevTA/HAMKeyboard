//
//  HAMKeyboardButton.swift
//  
//
//  Created by Timur Isaev on 27.06.2023.
//

import UIKit

class HAMKeyboardButton: UIButton {
    init(_ text: String, _ target: Any?, action: Selector) {
        super.init(frame: .zero)

        self.setTitle(text, for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods

private extension HAMKeyboardButton {
    func setupUI() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.titleLabel?.textColor = UIColor.white
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = 5
    }
}