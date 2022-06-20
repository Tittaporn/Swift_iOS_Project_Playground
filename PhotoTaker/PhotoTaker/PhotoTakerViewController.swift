//
//  PhotoTakerViewController.swift
//  PhotoTaker
//
//  Created by M3ts LLC on 10/7/21.
//

import UIKit

class PhotoTakerViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Outlets
    @IBOutlet weak var vwForPhotos: UIView!
    @IBOutlet weak var imgCurrentPhotoTaken: UIImageView!
    @IBOutlet weak var btnTakePhoto: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Properties
    var contenWidth: CGFloat = 0.0
    let scrollView: UIScrollView = {
        let scrollVw = UIScrollView()
        scrollVw.backgroundColor = .red
        return scrollVw
    }()
    /*  let image1: UIImageView = {
     let image = UIImageView()
     let img = UIImage(systemName: "1.circle")
     image.image = img
     return image
     }()
     let image2: UIImageView = {
     let image = UIImageView()
     let img = UIImage(systemName: "2.circle")
     image.image = img
     return image
     }()
     let image3: UIImageView = {
     let image = UIImageView()
     let img = UIImage(systemName: "3.circle")
     image.image = img
     return image
     }()
     let image4: UIImageView = {
     let image = UIImageView()
     let img = UIImage(systemName: "4.circle")
     image.image = img
     return image
     }()
     let image5: UIImageView = {
     let image = UIImageView()
     let img = UIImage(systemName: "5.circle")
     image.image = img
     return image
     }()
     */
    let stackView: UIStackView = {
    let stackView = UIStackView()
        stackView.backgroundColor = .yellow
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
    }()
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
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        imagesToDisplay = [image1,image2,image3,image4,image5,image1]
        var leading: NSLayoutXAxisAnchor? = vwForPhotos.leadingAnchor
        var trailing: NSLayoutXAxisAnchor? = vwForPhotos.trailingAnchor
        for image in imagesToDisplay {
            let anImageToDisplay = image
            let imageView = UIImageView(image: anImageToDisplay)
         let xCordinate =  vwForPhotos.frame.midX +  vwForPhotos.frame.width
            contenWidth += vwForPhotos.frame.width / 2
       
           // stackView.addSubview(imageView)
            imageView.frame = CGRect(x: xCordinate, y: vwForPhotos.frame.height, width: 100, height: 100)
            imageView.backgroundColor = .red
            stackView.addArrangedSubview(imageView)
           // imageView.anchor(top: vwForPhotos.topAnchor, bottom: vwForPhotos.bottomAnchor, leading: leading, trailing: trailing, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
           // leading = imageView.trailingAnchor
          
            scrollView.addSubview(stackView)
                   //scrollView.addSubview(imageView)
                 stackView.anchor(top: vwForPhotos.topAnchor, bottom: vwForPhotos.bottomAnchor, leading: vwForPhotos.leadingAnchor, trailing: vwForPhotos.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)

        }
//        stackView.addSubview(UIView())
        scrollView.contentSize = CGSize(width: contenWidth, height: vwForPhotos.frame.height)
    }
    
    // MARK: - Actions
    @IBAction func takePhotoButtonTapped(_ sender: Any) {
        imgCurrentPhotoTaken.image = image1
        //   let image = UIImage(systemName: "1.circle")
        // imgCurrentPhotoTaken  = image1
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\n\n+++++++++++ TEST  => scrollView.contentOffset : \(scrollView.contentOffset) +++++++++++ AT LINE : \(#line) +++ OF \(#function) +++ IN \(#file) +++++++++++\n\n")
    }
    
    // MARK: - Helper Functions
    func setupViews() {
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.backgroundColor = .none
        scrollView.anchor(top: vwForPhotos.topAnchor, bottom: vwForPhotos.bottomAnchor, leading: vwForPhotos.leadingAnchor, trailing: vwForPhotos.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        //scrollView.contentSize = CGSize(width: contenWidth, height: vwForPhotos.frame.height)
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
