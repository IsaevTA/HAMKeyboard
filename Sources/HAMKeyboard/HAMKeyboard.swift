//
//  HAMKeyboard.swift
//
//
//  Created by Timur Isaev on 27.06.2023.
//

import UIKit
import SnapKit

public class HAMKeyboard: UIView {
    weak var delegate: HAMKeyboardDelegate?

    private lazy var backspaceButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("")
        button.setImage(UIImage(systemName: "delete.left", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(tapBackspaceButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var slashButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("/")
        button.addTarget(self, action: #selector(tapButton(button:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var cancelButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("CANCEL")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor.systemRed
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var searchButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("SEARCH")
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(tapSearchButton), for: .touchUpInside)
        
        return button
    }()
    
    public init() {
        super.init(frame: .zero)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
    
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
    func createStack(line: HAMKeyboardButtonLine) -> UIStackView {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8

        line.getArrayButtons.forEach { button in
            button.addTarget(self, action: #selector(tapButton(button:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        
        return stack
    }
    
    func setupUI() {
        let stackNumberLine = createStack(line: .numberLine)
        addSubview(stackNumberLine)
        stackNumberLine.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(16)
        }

        let stackFirslLine = createStack(line: .firslLine)
        addSubview(stackFirslLine)
        stackFirslLine.snp.makeConstraints { make in
            make.top.equalTo(stackNumberLine.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
        }

        let stackSecondLine = createStack(line: .secondLine)
        addSubview(stackSecondLine)
        stackSecondLine.snp.makeConstraints { make in
            make.top.equalTo(stackFirslLine.snp.bottom).offset(10)
            
            make.left.equalTo(getElevent(views: stackFirslLine.arrangedSubviews, index: 0).snp.centerX)
            make.right.equalTo(getElevent(views: stackFirslLine.arrangedSubviews, index: stackFirslLine.arrangedSubviews.count - 1).snp.centerX)
        }

        let stackThirdLine = createStack(line: .thirdLine)
        addSubview(stackThirdLine)
        stackThirdLine.snp.makeConstraints { make in
            make.top.equalTo(stackSecondLine.snp.bottom).offset(10)
            
            make.left.equalTo(getElevent(views: stackSecondLine.arrangedSubviews, index: 1).snp.left)
            make.right.equalTo(getElevent(views: stackSecondLine.arrangedSubviews, index: stackSecondLine.arrangedSubviews.count - 2).snp.right)
        }

        addSubview(backspaceButton)
        backspaceButton.snp.makeConstraints { make in
            make.height.equalTo(stackThirdLine.snp.height)
            make.centerY.equalTo(stackThirdLine.snp.centerY)
            make.left.equalTo(stackThirdLine.snp.right).inset(-10)
            make.right.equalToSuperview().inset(5)
        }
        
        addSubview(slashButton)
        slashButton.snp.makeConstraints { make in
            make.height.equalTo(stackThirdLine.snp.height)
            make.centerY.equalTo(stackThirdLine.snp.centerY)
            make.left.equalToSuperview().inset(5)
            make.right.equalTo(stackThirdLine.snp.left).inset(-10)
        }

        addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(stackThirdLine.snp.bottom).offset(10)
            make.height.equalTo(stackThirdLine.snp.height)
            make.right.equalToSuperview().inset(5)
            make.left.equalTo(getElevent(views: stackThirdLine.arrangedSubviews, index: 1).snp.left)
        }

        addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(searchButton.snp.height)
            make.centerY.equalTo(searchButton.snp.centerY)
            make.right.equalTo(getElevent(views: stackThirdLine.arrangedSubviews, index: 0).snp.right)
            make.left.equalToSuperview().inset(5)
        }
    }
    
    func getElevent(views: [UIView], index: Int) -> HAMKeyboardButton {
        let array = views as! [HAMKeyboardButton]
        
        return array[index]
    }
    
    
    @objc
    func tapButton(button: HAMKeyboardButton) {
        let text = button.titleLabel?.text ?? ""
        delegate?.keyboard(self, string: text)
    }
    
    @objc
    func tapBackspaceButton() {
        delegate?.keyboardShouldReturnDelete(self)
    }
    
    @objc
    func tapCancelButton() {
        delegate?.keyboardShouldReturnCancel(self)
    }
    
    @objc
    func tapSearchButton() {
        delegate?.keyboardShouldReturnSearch(self)
    }
}
