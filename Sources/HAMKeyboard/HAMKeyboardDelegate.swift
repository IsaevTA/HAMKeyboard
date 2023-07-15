//
//  File.swift
//
//
//  Created by Timur Isaev on 27.06.2023.
//

import Foundation

public protocol HAMKeyboardDelegate: AnyObject {
    func keyboard(_ keyboard: HAMKeyboard, string: String)
    func keyboardShouldReturnDelete(_ keyboard: HAMKeyboard)
    func keyboardShouldReturnCancel(_ keyboard: HAMKeyboard)
    func keyboardShouldReturn(_ keyboard: HAMKeyboard)
}
