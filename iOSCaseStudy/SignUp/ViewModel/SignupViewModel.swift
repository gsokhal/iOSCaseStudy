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

extension SignupViewModelProtocol {
    
    /// This function validates the name.
    /// - Parameter name: name to be validated
    /// - Returns: true if its valid else false
    func isValidName(name: String) -> Bool {
        // Name should be of at least 3 letters
        let regex = "^.{3,}$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return namePredicate.evaluate(with: name.trimmingCharacters(in: .whitespaces))
    }
    
    /// This function validates the email.
    /// - Parameter email: email to be validated
    /// - Returns: true if its valid else false
    func isValidEmail(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: email)
    }
    
    /// This function validates the password.
    /// - Parameter password: password to be validated
    /// - Returns: true if its valid else false
    func isValidPassword(password: String) -> Bool {
        // Password should contain at least 8 characters with at least 1 number, 1 uppercase,
        // & 1 special character.
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%&*()]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        
        return passwordPredicate.evaluate(with: password)
    }
}

class SignupViewModel: SignupViewModelProtocol {
    
    
    
}
