//
//  ViewController.swift
//  ScrollTextFieldKeyboard
//
//  Created by M3ts LLC on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Username...",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "First name...",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Last name...",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.keyboardType = .emailAddress
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Email...",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.keyboardType = .default
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.attributedPlaceholder = NSAttributedString(string: "Password...",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    private let getLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("📍 Get Current Location", for: .normal)
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up!", for: .normal)
        button.backgroundColor = UIColor(named: "loginButtonColor")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    // MARK: - Properties
    var selectedImage: UIImage?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToHideKeyboardOnTapOnView()
        signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        getLocationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
        userNameField.delegate = self
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(userNameField)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(getLocationButton)
        scrollView.addSubview(signUpButton)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeProfilePicTapped))
        imageView.addGestureRecognizer(gesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width / 2
        imageView.frame = CGRect(x: (scrollView.width-size)/2, y: 24, width: size, height: size)
        userNameField.frame = CGRect(x: 30, y: imageView.bottom + 10, width: scrollView.width-60, height: 44)
        firstNameField.frame = CGRect(x: 30, y: userNameField.bottom + 10, width: scrollView.width-60, height: 44)
        lastNameField.frame = CGRect(x: 30, y: firstNameField.bottom + 10, width: scrollView.width-60, height: 44)
        emailField.frame = CGRect(x: 30, y: lastNameField.bottom + 10, width: scrollView.width-60, height: 44)
        passwordField.frame = CGRect(x: 30, y: emailField.bottom + 10, width: scrollView.width-60, height: 44)
        getLocationButton.frame = CGRect(x: 30, y: passwordField.bottom + 10, width: scrollView.width-60, height: 44)
        signUpButton.frame = CGRect(x: 30, y: getLocationButton.bottom + 30, width: scrollView.width-60, height: 44)
    }
    
    // MARK: - Methods
    @objc func changeProfilePicTapped() {
    }
    
    @objc func locationButtonTapped() {
    }
    
    @objc func signupButtonTapped() {
        view.endEditing(true)
    }
    
    func gotoTabbarVC() {
    }
}

// MARK: - Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            firstNameField.becomeFirstResponder()
        } else if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        } else if textField == lastNameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            locationButtonTapped()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.contentSize = CGSize(width: view.width, height: view.height + (view.height * 0.25))
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.frame.size.height + self.frame.origin.x
    }
}
