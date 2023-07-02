//
//  NumericKeyboard.swift
//  
//
//  Created by Timur Isaev on 01.07.2023.
//

import UIKit

class DigitButton: UIButton {
    var digit: Int = 0
}

public class NumericKeyboard: UIView {
    weak var target: (UIKeyInput & UITextInput)?
    var useDecimalSeparator: Bool
    
    lazy var parenthesis1: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "("
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapParenthesis1(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var squareroot: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "√"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapSquareRoot(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var parenthesis2: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = ")"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapParenthesis2), for: .touchUpInside)
        return button
    }()
    
    lazy var exponentButton: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "^0"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapExponentButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var exponentButton2: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "^2"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapExponentButton2(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var exponentButton3: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "^3"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapExponentButton3(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var exponentButton4: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "^"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapExponentButton4(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "+"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var subtractButton: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "-"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapSubtractButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var divideButton: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "/"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapDivideButton(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var multiplyButton: UIButton = {
        let button = UIButton(type: .system)
        let decimalSeparator = "*"
        button.setTitle(decimalSeparator, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = decimalSeparator
        button.addTarget(NumericKeyboard.self, action: #selector(didTapMultiplyButton(_:)), for: .touchUpInside)
        return button
    }()
    
    

    lazy var numericButtons: [DigitButton] = (0...9).map {
        let button = DigitButton(type: .system)
        button.digit = $0
        button.setTitle("\($0)", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.sizeToFit()
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.addTarget(NumericKeyboard.self, action: #selector(didTapDigitButton(_:)), for: .touchUpInside)
        button.inputView.self?.sizeToFit()
        return button
    }

    var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⌫", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Delete"
        button.addTarget(NumericKeyboard.self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        return button
    }()
    
    

    public init(target: UIKeyInput & UITextInput, useDecimalSeparator: Bool = false) {
        self.target = target
        self.useDecimalSeparator = useDecimalSeparator
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions

extension NumericKeyboard {
    
    @objc func didTapSquareRoot(_ sender: DigitButton) {
        insertText("√")
    }
    
    @objc func didTapParenthesis1(_ sender: DigitButton) {
        insertText("(")
    }
    
    @objc func didTapParenthesis2(_ sender: DigitButton) {
        insertText(")")
    }
    @objc func didTapDigitButton(_ sender: DigitButton) {
        insertText("\(sender.digit)")
    }

    @objc func didTapDecimalButton(_ sender: DigitButton) {
        insertText(Locale.current.decimalSeparator ?? ".")
    }
    
    @objc func didTapExponentButton(_ sender: DigitButton){
        insertText("^0")
    }
    
    @objc func didTapExponentButton2(_ sender: DigitButton){
        insertText("^2")
    }
    
    @objc func didTapExponentButton3(_ sender: DigitButton){
        insertText("^3")
    }
    
    @objc func didTapExponentButton4(_ sender: DigitButton){
        insertText("^")
    }
    
    
    @objc func didTapAddButton(_ sender: DigitButton){
        insertText("+")
    }
    
    
    @objc func didTapSubtractButton(_ sender: DigitButton){
        insertText("-")
    }
    
    
    @objc func didTapDivideButton(_ sender: DigitButton){
        insertText("/")
    }
    
    
    @objc func didTapMultiplyButton(_ sender: DigitButton){
        insertText("*")
    }

    @objc func didTapDeleteButton(_ sender: DigitButton) {
        target?.deleteBackward()
    }
}

// MARK: - Private initial configuration methods

private extension NumericKeyboard {
    func configure() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addButtons()
    }

    func addButtons() {
        let stackView = createStackView(axis: .vertical)
        stackView.frame = bounds
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(stackView)

        for row in 0 ..< 3 {
            let subStackView = createStackView(axis: .horizontal)
            stackView.addArrangedSubview(subStackView)

            for column in 0 ..< 3 {
                subStackView.addArrangedSubview(numericButtons[row * 3 + column + 1])
            }
        }

        let subStackView = createStackView(axis: .horizontal)
        stackView.addArrangedSubview(subStackView)

        subStackView.addArrangedSubview(numericButtons[0])
        
        subStackView.addArrangedSubview(parenthesis1)
        subStackView.addArrangedSubview(parenthesis2)
        subStackView.addArrangedSubview(squareroot)
                
        subStackView.addArrangedSubview(addButton)
        subStackView.addArrangedSubview(subtractButton)
        subStackView.addArrangedSubview(multiplyButton)
        subStackView.addArrangedSubview(divideButton)
        
        
        subStackView.addArrangedSubview(exponentButton)
        subStackView.addArrangedSubview(exponentButton2)
        subStackView.addArrangedSubview(exponentButton4)
        
        subStackView.addArrangedSubview(deleteButton)
        
    }

    func createStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }

    func insertText(_ string: String) {
        guard let range = target?.selectedRange else { return }

        if let textField = target as? UITextField, textField.delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) == false {
            return
        }

        if let textView = target as? UITextView, textView.delegate?.textView?(textView, shouldChangeTextIn: range, replacementText: string) == false {
            return
        }

        target?.insertText(string)
    }
}

// MARK: - UITextInput extension

extension UITextInput {
    var selectedRange: NSRange? {
        guard let textRange = selectedTextRange else { return nil }

        let location = offset(from: beginningOfDocument, to: textRange.start)
        let length = offset(from: textRange.start, to: textRange.end)
        return NSRange(location: location, length: length)
    }
}
