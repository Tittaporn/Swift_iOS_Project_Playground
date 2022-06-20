//
//  ViewController.swift
//  DocumentCamera
//
//  Created by M3ts LLC on 10/19/21.
//

import UIKit
import VisionKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var btnScan: UIButton!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        imv.backgroundColor = .yellow
    }
    
    // MARK: - Actions
    @IBAction func scannerButtonTapped(_ sender: Any) {
        scanDocument()
    }
    
    // MARK: - Helper Fuctions
    func scanDocument() {
        guard VNDocumentCameraViewController.isSupported else {
            print("document scanning not supported")
            return}
        let documentCameraController = VNDocumentCameraViewController()
        documentCameraController.delegate = self
        self.present(documentCameraController, animated: true, completion: nil)
    }
}

// MARK: - VNDocumentCameraViewControllerDelegate
extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        //controller.dismiss(animated: true, completion: nil)
        print("\n====  TEST  => scan.pageCount : \(scan.pageCount) ====  AT LINE : \(#line) ==== OF \(#function) ====  IN \(#file) ====\n")
        let firstScan = 0
        for i in 0..<scan.pageCount {
            let scannedImage = scan.imageOfPage(at: i)
            let bytes = scannedImage.jpegData(compressionQuality: 0.8)!
            print("page dimensions \(scannedImage.size.width) by \(scannedImage.size.height) - JPEG size \(bytes.count)")
            imv.image = scannedImage
            if i == firstScan {
                print("I am about to dismiss")
                controller.dismiss(animated: true)
            }
        }
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true, completion: nil)
        imv.image = nil
        print("\n====  TEST  =>  : CANCELED ==== AT LINE : \(#line) ====  OF \(#function) ====  IN \(#file) ====\n")
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true, completion: nil)
        imv.image = nil
        print("\n==== ERROR SCANNING RECEIPE IN \(#function) : \(error.localizedDescription) : \(error) ====\n")
    }
}
