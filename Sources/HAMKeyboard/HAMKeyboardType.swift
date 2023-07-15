//
//  HAMKeyboardType.swift
//  
//
//  Created by Timur Isaev on 09.07.2023.
//

import Foundation

public enum HAMKeyboardType {
    case search
    case done
    
    var title: String {
        switch self {
        case .search: return "SEARCH"
        case .done: return "DONE"
        }
    }
}
