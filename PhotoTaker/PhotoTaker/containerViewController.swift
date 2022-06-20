//
//  containerViewController.swift
//  PhotoTaker
//
//  Created by M3ts LLC on 10/7/21.
//

import UIKit

class containerViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var imagView: UIImageView!
    @IBOutlet weak var scrollerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let image1: UIImage = {
        let image = UIImage(systemName: "1.circle")
        return image ?? UIImage()
    }()
    let image2: UIImage = {
        let image = UIImage(systemName: "2.circle")
        return image ?? UIImage()
    }()
    let image3: UIImage = {
        let image = UIImage(systemName: "3.circle")
        return image ?? UIImage()
    }()
    let image4: UIImage = {
        let image = UIImage(systemName: "4.circle")
        return image ?? UIImage()
    }()
    let image5: UIImage = {
        let image = UIImage(systemName: "5.circle")
        return image ?? UIImage()
    }()
    var imagesToDisplay: [UIImage] = []
    var contenWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        imagesToDisplay = [image1,image2,image3,image4,image5,image1]
        for image in imagesToDisplay {
            let anImageToDisplay = image
            imagView.image = anImageToDisplay
            //let imageView = UIImageView(image: anImageToDisplay)
           // scrollerView.addSubview(imageView)
       //  let xCordinate =  view.frame.midX +  view.frame.width * CGFloat(300)
            contenWidth += view.frame.width
       
        
        }
        scrollerView.contentSize = CGSize(width: contenWidth, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(374))
    }
    // MARK: - Helper Functions
    func setupViews() {
        scrollerView.delegate = self
        //view.topAnchor
        //view.addSubview(scrollerView)
        scrollerView.backgroundColor = .brown
        scrollerView.anchor(top: view.topAnchor
,bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        //scrollView.contentSize = CGSize(width: contenWidth, height: vwForPhotos.frame.height)
    }
}
