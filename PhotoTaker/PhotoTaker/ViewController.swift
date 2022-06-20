//
//  ViewController.swift
//  PhotoTaker
//
//  Created by M3ts LLC on 10/6/21.
//

import UIKit
class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var photoImageView1: UIImageView!
    @IBOutlet weak var selectPhotoButton1: UIButton!
    @IBOutlet weak var photoImageView2: UIImageView!
    @IBOutlet weak var selectPhotoButton2: UIButton!
    @IBOutlet weak var photoImageView3: UIImageView!
    @IBOutlet weak var selectPhotoButton3: UIButton!
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    var currentLocation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func takePhoto1(_ sender: Any) {
        currentLocation = 1
        openCamera()
    }
    
    @IBAction func takePhoto2(_ sender: Any) {
        currentLocation = 2
        openCamera()
    }
    
    @IBAction func takePhoto3(_ sender: Any) {
        currentLocation = 3
        openCamera()
    }
}

// MARK: -  UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openCamera() {
        // we check if camera is source, then present imagePicker.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else { //Camera Source is not available.
            let alert = UIAlertController(title: "No camera access", message: "Plese allow access to the Camera to use this feature", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else { //photoLibrary Source is not available.
            let alert = UIAlertController(title: "No photo access", message: "Plese allow access to the Photos to use this feature", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            switch currentLocation {
            case 1:
                photoImageView1.image = pickedImage
            case 2:
                photoImageView2.image = pickedImage
            case 3:
                photoImageView3.image = pickedImage
            default:
                print("I don't know what to do")
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

