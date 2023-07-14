//
//  UIViewControllerExtension.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import UIKit

protocol ShowAlertProtocol {
    func showAlert(title: String, message: String, view: UIViewController)
}

extension ShowAlertProtocol {
    func showAlert(title: String, message: String, view: UIViewController) {
        let alertAction = UIAlertAction(title: Constants.alertOk.localize(), style: .default)
        alertAction.accessibilityIdentifier = Constants.alertOk
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)

        view.present(alert, animated: true)
    }
}
