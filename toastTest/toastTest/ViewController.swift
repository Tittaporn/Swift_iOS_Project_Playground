//
//  ViewController.swift
//  toastTest
//
//  Created by M3ts LLC on 12/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showToastWith(duration: 5, message: "ShowToastWith")
        //    showToastOnCenterWith(duration: 10, message: "showToastOnCenterWithLine1 \nshowToastOnCenterWithLine1")
        // showToastOnCenterWith2Line(duration: 20, firstLineMessage: "Congratulation ! Lee McCormick", secondLineMessage: "You have just won $5 dollar!")
        let backgroundImage = UIImage(named: "black") ?? UIImage()
        showToast2LineAndBGImage(duration: 10, messageLine1: "Congratulation ! Lee McCormick", messageLine2: "You have just won $5 dollar!", backgroudImage: backgroundImage)
        
    }
}

extension UIViewController {
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showToastWith(duration: TimeInterval, message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    func showToastOnCenterWith(duration: TimeInterval, message : String) {
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2, width: self.view.frame.width * 0.9, height: 100))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    func showToastOnCenterWith2Line(duration: TimeInterval, firstLineMessage: String, secondLineMessage: String) {
        
        let toastImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.5))
        toastImageView.center = self.view.center
        toastImageView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastImageView.image = UIImage(named: "black")
        toastImageView.alpha = 1.0
        toastImageView.layer.cornerRadius = 10;
        toastImageView.clipsToBounds  =  true
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 - 50, width: self.view.frame.width * 0.9, height: 50))
        toastLabel.textColor = UIColor.white
        toastLabel.font = .chalkduster
        toastLabel.textAlignment = .center;
        toastLabel.text = firstLineMessage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        
        
        let toast2Label = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 + 20, width: self.view.frame.width * 0.9, height: 50))
        toast2Label.textColor = UIColor.white
        toast2Label.font = .markerFelt
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
    
    func showToast2LineAndBGImage(duration: TimeInterval, messageLine1: String, messageLine2: String, backgroudImage: UIImage) {
        let toastImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.5))
        toastImageView.center = self.view.center
        toastImageView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toastImageView.image = backgroudImage
        toastImageView.alpha = 1.0
        toastImageView.layer.cornerRadius = 10;
        toastImageView.clipsToBounds  =  true
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 - 50, width: self.view.frame.width * 0.9, height: 50))
        toastLabel.textColor = UIColor.white
        toastLabel.font = .chalkduster
        toastLabel.textAlignment = .center;
        toastLabel.text = messageLine1
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        let toast2Label = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height/2 + 20, width: self.view.frame.width * 0.9, height: 50))
        toast2Label.textColor = UIColor.white
        toast2Label.font = .markerFelt
        toast2Label.textAlignment = .center;
        toast2Label.text = messageLine2
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
}


extension UIFont {
    static let party = UIFont(name: "Party LET Plain", size: 50)
    static let chalkduster = UIFont(name: "Chalkduster", size: 25)
    static let markerFelt = UIFont(name: "Marker Felt Thin", size: 30)
}
