//
//  ViewController.swift
//  BiometricAuthentication
//
//  Created by M3ts LLC on 10/22/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemTeal
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func didTapButton() {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorize with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                guard success, error == nil else {
                    // failed
                    let alert = UIAlertController(title: "Failed to authentication !", message: "Please, try again!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self?.present(alert, animated:  true)
                    return
                }
                // show other screen
                // success
                DispatchQueue.main.async {
                    let vc = UIViewController()
                    vc.title = "Welcome"
                    vc.view.backgroundColor = .systemPink
                    self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
                }
            }
        } else {
            print("Can not use biometrics!")
            let alert = UIAlertController(title: "Unavailable!", message: "You can not use biometrics authentication!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated:  true)
        }
    }
}

