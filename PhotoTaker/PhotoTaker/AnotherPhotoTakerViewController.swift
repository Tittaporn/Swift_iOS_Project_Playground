//
//  AnotherPhotoTakerViewController.swift
//  PhotoTaker
//
//  Created by M3ts LLC on 10/7/21.
//

import UIKit

class AnotherPhotoTakerViewController: UIViewController {

    @IBOutlet weak var vwScrollerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = .red
        scrollView.anchor(top: vwScrollerView.topAnchor, bottom: vwScrollerView.bottomAnchor, leading: vwScrollerView.leadingAnchor, trailing: vwScrollerView.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
