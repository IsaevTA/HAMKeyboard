//
//  HAMKeyboardButton.swift
//
//
//  Created by Timur Isaev on 27.06.2023.
//

import UIKit

class HAMKeyboardButton: UIButton {
    init(_ text: String) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setBackgroundColor(color: UIColor.gray, forState: .highlighted)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Extension UIButton

extension UIButton {

    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: forState)
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
