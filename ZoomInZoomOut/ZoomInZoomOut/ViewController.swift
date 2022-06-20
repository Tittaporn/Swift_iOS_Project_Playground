//
//  ViewController.swift
//  ZoomInZoomOut
//
//  Created by M3ts LLC on 5/26/22.
//

import UIKit

class ViewController: UIViewController {

    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemPink
        return myView
    }()
    
    private let size: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        myView.center = view.center
        addGesture()
        
    }
    private func addGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        myView.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed {
            let scale = gesture.scale
            print("scale : \(scale)")
            myView.frame = CGRect(x: 0, y: 0, width: size * scale, height: size * scale)
            myView.center = view.center
        }
    }
}

// https://www.youtube.com/watch?v=v6XQlgqCw18
