//
//  HAMKeyboard.swift
//
//
//  Created by Timur Isaev on 27.06.2023.
//

import UIKit

public class HAMKeyboard: UIView {
    public weak var delegate: HAMKeyboardDelegate?

    private var typeKeybaord: HAMKeyboardType = .search
    
    private lazy var backspaceButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("")
        button.setImage(UIImage(systemName: "delete.left", withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(tapBackspaceButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var slashButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("/")
        button.addTarget(self, action: #selector(tapButton(button:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var cancelButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton("CANCEL")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor.systemRed
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var returnButton: HAMKeyboardButton = {
        let button = HAMKeyboardButton(typeKeybaord.title)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(tapReturnButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public init(type: HAMKeyboardType = .search) {
        super.init(frame: .zero)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.typeKeybaord = type
        
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
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        line.getArrayButtons.forEach { button in
            button.addTarget(self, action: #selector(tapButton(button:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        
        return stack
    }
    
    func setupUI() {
        let stackNumberLine = createStack(line: .numberLine)
        addSubview(stackNumberLine)
        stackNumberLine.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackNumberLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        stackNumberLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        let stackFirslLine = createStack(line: .firslLine)
        addSubview(stackFirslLine)
        stackFirslLine.topAnchor.constraint(equalTo: stackNumberLine.bottomAnchor, constant: 10).isActive = true
        stackFirslLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        stackFirslLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true


        let stackSecondLine = createStack(line: .secondLine)
        addSubview(stackSecondLine)
        stackSecondLine.topAnchor.constraint(equalTo: stackFirslLine.bottomAnchor, constant: 10).isActive = true
        stackSecondLine.leftAnchor.constraint(equalTo: getElevent(views: stackFirslLine.arrangedSubviews, index: 0).centerXAnchor).isActive = true
        stackSecondLine.rightAnchor.constraint(equalTo: getElevent(views: stackFirslLine.arrangedSubviews, index: stackFirslLine.arrangedSubviews.count - 1).centerXAnchor).isActive = true

        let stackThirdLine = createStack(line: .thirdLine)
        addSubview(stackThirdLine)
        stackThirdLine.topAnchor.constraint(equalTo: stackSecondLine.bottomAnchor, constant: 10).isActive = true
        stackThirdLine.leftAnchor.constraint(equalTo: getElevent(views: stackSecondLine.arrangedSubviews, index: 1).leftAnchor).isActive = true
        stackThirdLine.rightAnchor.constraint(equalTo: getElevent(views: stackSecondLine.arrangedSubviews, index: stackSecondLine.arrangedSubviews.count - 2).rightAnchor).isActive = true

        addSubview(backspaceButton)
        backspaceButton.heightAnchor.constraint(equalTo: stackThirdLine.heightAnchor).isActive = true
        backspaceButton.centerYAnchor.constraint(equalTo: stackThirdLine.centerYAnchor).isActive = true
        backspaceButton.leftAnchor.constraint(equalTo: stackThirdLine.rightAnchor, constant: 10).isActive = true
        backspaceButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true

        addSubview(slashButton)
        slashButton.heightAnchor.constraint(equalTo: stackThirdLine.heightAnchor).isActive = true
        slashButton.centerYAnchor.constraint(equalTo: stackThirdLine.centerYAnchor).isActive = true
        slashButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        slashButton.rightAnchor.constraint(equalTo: stackThirdLine.leftAnchor, constant: -10).isActive = true

        addSubview(returnButton)
        returnButton.topAnchor.constraint(equalTo: stackThirdLine.bottomAnchor, constant: 10).isActive = true
        returnButton.heightAnchor.constraint(equalTo: stackThirdLine.heightAnchor).isActive = true
        returnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        returnButton.leftAnchor.constraint(equalTo: getElevent(views: stackThirdLine.arrangedSubviews, index: 1).leftAnchor, constant: 5).isActive = true

        addSubview(cancelButton)
        cancelButton.heightAnchor.constraint(equalTo: returnButton.heightAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: returnButton.centerYAnchor).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: getElevent(views: stackThirdLine.arrangedSubviews, index: 0).rightAnchor).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
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
    func tapReturnButton() {
        delegate?.keyboardShouldReturn(self)
    }
}
