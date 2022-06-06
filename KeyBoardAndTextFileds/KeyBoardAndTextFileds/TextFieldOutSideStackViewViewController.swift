//
//  TextFieldOutSideStackViewViewController.swift
//  KeyBoardAndTextFileds
//
//  Created by M3ts LLC on 6/3/22.
//

import UIKit

class TextFieldOutSideStackViewViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Outlets
    @IBOutlet weak var vwCard: UIView!
    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var tf1dollar: UITextField!
    @IBOutlet weak var tf2dollar: UITextField!
    @IBOutlet weak var tf5dollar: UITextField!
    @IBOutlet weak var tf10dollar: UITextField!
    @IBOutlet weak var tf20dollar: UITextField!
    @IBOutlet weak var tf100dollar: UITextField!
    
    // MARK: - Properties
    var activeTextFiled: UITextField!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        vwCard.backgroundColor = .white
        tfTotal.delegate = self
        tf1dollar.delegate = self
        tf2dollar.delegate = self
        tf10dollar.delegate = self
        tf20dollar.delegate = self
        tf100dollar.delegate = self
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        tfTotal.text = ""
        tf1dollar.text = ""
        tf2dollar.text = ""
        tf10dollar.text = ""
        tf20dollar.text = ""
        tf100dollar.text = ""
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        vwCard.isHidden = true
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        if  let editingTextFieldY: CGFloat = self.activeTextFiled?.frame.origin.y {
            
            if self.view.frame.origin.y >= 0 {
                // Checking if the textField is really hidden behide the keyboard
                if editingTextFieldY > keyboardY - 60 {
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY - (keyboardY - 60)), width: self.view.bounds.width, height: self.view.bounds.height)
                    }, completion: nil)
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextFiled = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

/* Source :
 https://www.youtube.com/watch?v=AiYCStoj0lc
 */
