//
//  ValidationService.swift
//  UnitTestExample
//
//  Created by M3ts LLC on 6/23/22.
//

import Foundation

// MARK: - ValidationService
struct ValidationService {
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20  else { throw ValidationError.usernameTooLong }
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20  else { throw ValidationError.passwordTooLong }
        return password
    }
}

// MARK: - ValidationError
enum ValidationError : LocalizedError {
    case invalidValue
    case usernameTooShort
    case usernameTooLong
    case passwordTooShort
    case passwordTooLong
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value."
        case .usernameTooShort:
            return "You username is too short."
        case .usernameTooLong:
            return "You username is too long."
        case .passwordTooShort:
            return "You password is too short."
        case .passwordTooLong:
            return "You password is too longØ."
        }
    }
}
