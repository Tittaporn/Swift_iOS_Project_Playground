//
//  ViewController.swift
//  CardImageView
//
//  Created by M3ts LLC on 12/22/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showToastOnCenterWith2Line(duration: 10, firstLineMessage: "1", secondLineMessage: "2")
        showCardWithImage(firstLineMessage: "Hey", secondLineMessage: "Line 2")
    }
    
    func showToastOnCenterWith2Line(duration: TimeInterval, firstLineMessage: String, secondLineMessage: String) {
        let toastImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.5))
        toastImageView.center = self.view.center
        toastImageView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastImageView.image = UIImage()
        toastImageView.alpha = 1.0
        toastImageView.layer.cornerRadius = 10;
        toastImageView.clipsToBounds  =  true
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 - 50, width: self.view.frame.width * 0.9, height: 50))
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = firstLineMessage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        let toast2Label = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 + 20, width: self.view.frame.width * 0.9, height: 50))
        toast2Label.textColor = UIColor.white
        toast2Label.textAlignment = .center;
        toast2Label.text = secondLineMessage
        toast2Label.alpha = 1.0
        toast2Label.layer.cornerRadius = 10;
        toast2Label.clipsToBounds  =  true
        self.view.addSubview(toastImageView)
        self.view.addSubview(toastLabel)
        self.view.addSubview(toast2Label)
        
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            toast2Label.alpha = 0.0
            toastImageView.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
            toast2Label.removeFromSuperview()
            toastImageView.removeFromSuperview()
        })
    }
    
    func showCardWithImage(firstLineMessage: String, secondLineMessage: String) {
        let toastImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.5))
        toastImageView.center = self.view.center
        toastImageView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastImageView.alpha = 1.0
        toastImageView.layer.cornerRadius = 10;
        toastImageView.clipsToBounds  =  true
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 - 50, width: self.view.frame.width * 0.9, height: 50))
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = firstLineMessage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        let toast2Label = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 + 20, width: self.view.frame.width * 0.9, height: 50))
        toast2Label.textColor = UIColor.white
        toast2Label.textAlignment = .center;
        toast2Label.text = secondLineMessage
        toast2Label.alpha = 1.0
        toast2Label.layer.cornerRadius = 10;
        toast2Label.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        self.view.addSubview(toast2Label)
    }
}

