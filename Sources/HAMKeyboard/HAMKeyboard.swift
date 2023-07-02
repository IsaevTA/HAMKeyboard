//
//  File.swift
//  
//
//  Created by Timur Isaev on 27.06.2023.
//

import UIKit
import SnapKit

public class HAMKeyboard: UIView {
    weak var keyboardDelegate: HAMKeyboardDelegate?
    
    private let arrayTitleButton: [[String]] = [
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M", " < "],
        ["CANCEL", "SEARCH"]
    ]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods

private extension HAMKeyboard {
    func createStack(arrayTitle: [String]) -> UIStackView {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        arrayTitle.forEach { title in
            stack.addArrangedSubview(HAMKeyboardButton(title, self, action: #selector(tapButton)))
        }
        
        return stack
    }
    
    func setupUI() {
        let stackFirst = createStack(arrayTitle: arrayTitleButton[0])
        let stackSecond = createStack(arrayTitle: arrayTitleButton[1])
        let stackThird = createStack(arrayTitle: arrayTitleButton[2])
        let stackFourth = createStack(arrayTitle: arrayTitleButton[3])
        let stackMain = UIStackView(arrangedSubviews: [stackFirst, stackSecond, stackThird, stackFourth])
        
        self.addSubview(stackMain)
        stackMain.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    @objc
    func tapButton(button: HAMKeyboardButton) {
        print(button.titleLabel?.text ?? "")
    }
}
