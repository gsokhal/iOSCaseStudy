//
//  SignupViewModel.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import Foundation

protocol SignupViewModelProtocol {
    func isValidName(name: String) -> Bool
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
}

class SignupViewModel: SignupViewModelProtocol, ValidationProtocol {

    /// This function validates the name.
    /// - Parameter name: name to be validated
    /// - Returns: true if its valid else false
    func isValidName(name: String) -> Bool {
        return isValidName(name)
    }

    /// This function validates the email.
    /// - Parameter email: email to be validated
    /// - Returns: true if its valid else false
    func isValidEmail(email: String) -> Bool {

        return isValidEmail(email)
    }

    /// This function validates the password.
    /// - Parameter password: password to be validated
    /// - Returns: true if its valid else false
    func isValidPassword(password: String) -> Bool {
        return isValidPassword(password)
    }
}
