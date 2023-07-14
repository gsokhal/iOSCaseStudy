//
//  SignupViewController.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import UIKit

class SignupViewController: UIViewController {

    // IBOutlets
    @IBOutlet private weak var mainScrollView: UIScrollView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameTextfield: UITextField!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var signupButton: UIButton!

    // Variable
    private let viewModel: SignupViewModelProtocol = SignupViewModel()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        doInitialSetup()
    }

}

// MARK: - Helper Methods
extension SignupViewController {
    // This function performs all initial setup
    private func doInitialSetup() {
        addNotificationObserverForKeyboard()
        updateStringsOnScreen()
        addDoneButtonOnKeyboard()
    }

    // This function adds keyboard sho/hide notifications
    private func addNotificationObserverForKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // This function add localised text on screen
    private func updateStringsOnScreen() {
        titleLabel.text = Constants.createNewAccount.localize()
        nameTextfield.placeholder = Constants.enterYourName.localize()
        emailTextfield.placeholder = Constants.enterYourEmail.localize()
        passwordTextfield.placeholder = Constants.enterYourPassword.localize()
        signupButton.setTitle(Constants.signup.localize(), for: .normal)
    }

    private func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let donebutton = UIBarButtonItem(
            title: Constants.done.localize(),
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(doneButtonAction)
        )
        donebutton.accessibilityIdentifier = Constants.done
        toolbar.setItems([donebutton], animated: false)

        nameTextfield.inputAccessoryView = toolbar
        emailTextfield.inputAccessoryView = toolbar
        passwordTextfield.inputAccessoryView = toolbar
    }
}

// MARK: - Button Actions
extension SignupViewController: ShowAlertProtocol, ValidationProtocol {

    @objc private func doneButtonAction() {
        // dismissing the keyboard
        view.endEditing(true)
    }

    @IBAction private func signupButtonAction(_ sender: Any) {
        // hidding the keyboard
        doneButtonAction()

        // Validating the inputs

        if let name = nameTextfield.text,
           !viewModel.isValidName(name: name) {

            showAlert(
                title: Constants.alertTitleInvalid.localize(),
                message: Constants.invalidName.localize(),
                view: self
            )
            return
        } else if let email = emailTextfield.text,
                !viewModel.isValidEmail(email: email) {

            showAlert(
                title: Constants.alertTitleInvalid.localize(),
                message: Constants.invalidEmail.localize(),
                view: self
            )
            return
        } else if let password = passwordTextfield.text,
                !viewModel.isValidPassword(password: password) {

            showAlert(
                title: Constants.alertTitleInvalid.localize(),
                message: Constants.invalidPassword.localize(),
                view: self
            )
            return
        }

        // Navigate to feeds screen
        navigateToFeedViewController()
    }

}

// MARK: - Navigation
extension SignupViewController {
    
    private func navigateToFeedViewController() {
        present(
            (storyboard?.instantiateViewController(
                withIdentifier: "\(FeedViewController.self)"
            )) as? FeedViewController ?? UIViewController(),
            animated: true,
            completion: nil
        )
    }
}

// MARK: - Keyboard notification observer methods
extension SignupViewController {

    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           mainScrollView.contentInset.bottom != keyboardSize.height {

            mainScrollView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: keyboardSize.height,
                right: 0
            )
        }
    }

    @objc private func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           mainScrollView.contentInset.bottom != -keyboardSize.height {
            
            mainScrollView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: -keyboardSize.height,
                right: 0
            )
        }
    }
}
