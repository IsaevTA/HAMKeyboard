//
//  HAMKeyboardButtonLine.swift
//  CallsingQRZ
//
//  Created by Timur Isaev on 02.07.2023.
//  Copyright © 2023 Timur Isaev. All rights reserved.
//

import UIKit

enum HAMKeyboardButtonLine: CaseIterable {
    case numberLine
    case firslLine
    case secondLine
    case thirdLine
}

extension HAMKeyboardButtonLine {
    var getArrayButtons: [HAMKeyboardButton] {
        switch self {
        case .numberLine :
            return getTitleButtons.map { HAMKeyboardButton($0) }
        case .firslLine:
            return getTitleButtons.map { HAMKeyboardButton($0) }
        case .secondLine:
            return getTitleButtons.map { HAMKeyboardButton($0) }
        case .thirdLine:
            return getTitleButtons.map { HAMKeyboardButton($0) }
        }
    }
}

private extension HAMKeyboardButtonLine {
    var getTitleButtons: [String] {
        switch self {
        case .numberLine :
            return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        case .firslLine:
            return ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        case .secondLine:
            return ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
        case .thirdLine:
            return ["Z", "X", "C", "V", "B", "N", "M"]
        }
    }
}
