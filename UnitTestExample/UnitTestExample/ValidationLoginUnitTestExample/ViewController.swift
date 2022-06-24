//
//  ViewController.swift
//  UnitTestExample
//
//  Created by M3ts LLC on 6/23/22.
//

import UIKit

// MARK: - Model
struct User {
    let username: String
    let password: String
}

// MARK: - UIViewController
class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    
    // MARK: - Properties
    private let dummyDatabase = [User(username: "username", password: "password")]
    private let validation: ValidationService
    
    // MARK: - init
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    // MARK: - Actions
    @IBAction func logginButtonTapped(_ sender: Any) {
        do {
            let username = try validation.validateUsername(tfUserName.text)
            let password = try validation.validatePassword(tfPassword.text)
            // Login to database...
            if let user = dummyDatabase.first(where: { user in user.username == username && user.password == password }) {
                print("You are successfully logged in as \(user.username)")
                displayAlertAndGoToNoiseMakerVC(title: "Success !", message: "You are successfully logged in as \(user.username)")
            } else {
                throw LogginError.invaildCredentials
            }
        } catch {
            print("Error trying to log in : \(error)")
            displayAlert(title: "Error !", message: "Error trying to log in : \(error)")
        }
    }
}

// MARK: - ViewController Extension
extension ViewController {
    enum LogginError: LocalizedError {
        case invaildCredentials
    }
    
    private func displayAlert(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { (action) -> Void in
            print("Ok button tapped")
        }
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    private func displayAlertAndGoToNoiseMakerVC(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Go To Noise Maker", style: .cancel) { (action) -> Void in
            self.goToNoiseMakerVC()
        }
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    private func goToNoiseMakerVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  vc = storyboard.instantiateViewController(identifier: "NoiseMakerStoryboardID")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
