//
//  ViewController.swift
//  ScrollView
//
//  Created by Lee McCormick on 5/7/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Views
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let cameraView: UIView = {
        let cameraView = UIView()
        cameraView.clipsToBounds = true
        return cameraView
    }()
    private let buttonHideOrShow: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.setTitle("Show", for: .normal)
        return btn
    }()
    private let topView: UIView = {
        let topView = UIView()
        topView.clipsToBounds = true
        return topView
    }()
    private let middleView: UIView = {
        let middleView = UIView()
        middleView.clipsToBounds = true
        return middleView
    }()
    private let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.clipsToBounds = true
        return bottomView
    }()
    private let topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.clipsToBounds = true
        topStackView.axis = .vertical
        topStackView.spacing = 5.0
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        return topStackView
    }()
    private let middleStackView: UIStackView = {
        let middleStackView = UIStackView()
        middleStackView.clipsToBounds = true
        middleStackView.axis = .vertical
        middleStackView.spacing = 5.0
        middleStackView.alignment = .fill
        middleStackView.distribution = .fillEqually
        return middleStackView
    }()
    private let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.clipsToBounds = true
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 5.0
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        return bottomStackView
    }()
    
    // Location Info
    private let lblLocationInfo: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Location Info"
        lbl.textAlignment = .center
        return lbl
    }()
    private let lblOperatorId: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Operator ID : "
        return lbl
    }()
    private let lblPropertyId: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Property ID : "
        return lbl
    }()
    private let lblFloor: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Floor : "
        return lbl
    }()
    private let lblZone: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Zone : "
        return lbl
    }()
    private let lblArea: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Area : "
        return lbl
    }()
    private let lblBank: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Bank : "
        return lbl
    }()
    private let lblPosition: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Position : "
        return lbl
    }()
    private let lblLocation: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Location : "
        return lbl
    }()
    private let lblMachineNumber: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Machine Number : "
        return lbl
    }()
    private let lblFCTimeZoneId: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "FC Time Zone Id : "
        return lbl
    }()
    
    // Smith Info
    private let lblSmithInfo: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Smith Info"
        lbl.textAlignment = .center
        return lbl
    }()
    private let lblVersion: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Version : "
        return lbl
    }()
    private let lblLastTimeBoardReset: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Last Time Board Reset : "
        return lbl
    }()
    private let lblNumberOfTimeBoardBeenReset: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Number Of Time Board Been Reset : "
        return lbl
    }()
    private let lblIsSASConnected: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Is SAS Connected : "
        return lbl
    }()
    private let lblIsSASMetersReported: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Is SAS Meters Reported : "
        return lbl
    }()
    private let lblIsSASTicketConfigSet : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Is SAS Ticket Config Set : "
        return lbl
    }()
    private let lblIsSASValidationIdSet: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Is SAS ValidationId Set : "
        return lbl
    }()
    private let lblConnectionIp: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Connection IP : "
        return lbl
    }()
    private let lblHowLongTillGetResponse: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "How Long Till Get Response : "
        return lbl
    }()
    private let lblInternet: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Internet : "
        return lbl
    }()
    private let lblSignalStrength: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Signal Strength : "
        return lbl
    }()
    private let lblCurrentCardNumber: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Current Card Number : "
        return lbl
    }()
    private let lblCurrentUserName: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Current User Name : "
        return lbl
    }()
    
    // SNX Info
    private let lblSnx: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "SNX Info"
        lbl.textAlignment = .center
        return lbl
    }()
    private let lblSnxExpirationDays: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Expiration Days : "
        return lbl
    }()
    private let lblSnxHostId: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Host ID : "
        return lbl
    }()
    private let lblSnxLocation: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Location : "
        return lbl
    }()
    private let lblSnxAddressLine1: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Address Line1 : "
        return lbl
    }()
    private let lblSnxAddressLine2: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Address Line2 : "
        return lbl
    }()
    private let lblSnxMachine: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.text = "Machine : "
        return lbl
    }()
    
    // MARK: - Properties
    var showInfo = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Colors
        view.backgroundColor = .blue
        scrollView.backgroundColor = .red
        cameraView.backgroundColor = .yellow
        topView.backgroundColor = .purple
        middleView.backgroundColor = .magenta
        bottomView.backgroundColor = .green
        topStackView.backgroundColor = .cyan
        middleStackView.backgroundColor = .systemPink
        bottomStackView.backgroundColor = .link
        buttonHideOrShow.backgroundColor = .orange
        
        // Add Views
        view.addSubview(scrollView)
        view.addSubview(cameraView)
        scrollView.addSubview(topView)
        scrollView.addSubview(middleView)
        scrollView.addSubview(bottomView)
        topView.addSubview(topStackView)
        middleView.addSubview(middleStackView)
        bottomView.addSubview(bottomStackView)
        
        // CameraView
        cameraView.addSubview(buttonHideOrShow)
        
        // Top Info
        topStackView.addArrangedSubview(lblLocationInfo)
        topStackView.addArrangedSubview(lblOperatorId)
        topStackView.addArrangedSubview(lblPropertyId)
        topStackView.addArrangedSubview(lblFloor)
        topStackView.addArrangedSubview(lblZone)
        topStackView.addArrangedSubview(lblArea)
        topStackView.addArrangedSubview(lblBank)
        topStackView.addArrangedSubview(lblPosition)
        topStackView.addArrangedSubview(lblLocation)
        topStackView.addArrangedSubview(lblMachineNumber)
        topStackView.addArrangedSubview(lblFCTimeZoneId)
        
        // Middle Info
        middleStackView.addArrangedSubview(lblSmithInfo)
        middleStackView.addArrangedSubview(lblVersion)
        middleStackView.addArrangedSubview(lblLastTimeBoardReset)
        middleStackView.addArrangedSubview(lblNumberOfTimeBoardBeenReset)
        middleStackView.addArrangedSubview(lblIsSASConnected)
        middleStackView.addArrangedSubview(lblIsSASMetersReported)
        middleStackView.addArrangedSubview(lblIsSASTicketConfigSet)
        middleStackView.addArrangedSubview(lblIsSASValidationIdSet)
        middleStackView.addArrangedSubview(lblConnectionIp)
        middleStackView.addArrangedSubview(lblHowLongTillGetResponse)
        middleStackView.addArrangedSubview(lblInternet)
        middleStackView.addArrangedSubview(lblSignalStrength)
        middleStackView.addArrangedSubview(lblCurrentCardNumber)
        middleStackView.addArrangedSubview(lblCurrentUserName)
        
        // SNX Info
        bottomStackView.addArrangedSubview(lblSnx)
        bottomStackView.addArrangedSubview(lblSnxExpirationDays)
        bottomStackView.addArrangedSubview(lblSnxHostId)
        bottomStackView.addArrangedSubview(lblSnxLocation)
        bottomStackView.addArrangedSubview(lblSnxAddressLine1)
        bottomStackView.addArrangedSubview(lblSnxAddressLine2)
        bottomStackView.addArrangedSubview(lblSnxMachine)
        
        buttonHideOrShow.addTarget(self, action: #selector(showOrHideButtonTapped), for: .touchUpInside)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cameraView.frame = CGRect(x: view.frame.width * 0.05, y: view.top + 70, width: view.frame.width * 0.9, height: view.frame.height * 0.1)
        buttonHideOrShow.frame =  CGRect(x: cameraView.frame.width * 0.1, y: cameraView.frame.height * 0.1, width: cameraView.frame.width * 0.8, height: cameraView.frame.height * 0.8)
        scrollView.frame = view.bounds
        let topViewHeight = CGFloat(topStackView.subviews.count * 40)
        let middleViewHeight = CGFloat(middleStackView.subviews.count * 40)
        let bottomViewHeight = CGFloat(bottomStackView.subviews.count * 40)
        topView.frame = CGRect(x: view.frame.width * 0.05, y: cameraView.bottom, width: view.frame.width * 0.9, height: topViewHeight)
        middleView.frame = CGRect(x: view.frame.width * 0.05, y: topView.bottom + 20, width: view.frame.width * 0.9, height: middleViewHeight)
        bottomView.frame = CGRect(x: view.frame.width * 0.05, y: middleView.bottom + 20, width: view.frame.width * 0.9, height: bottomViewHeight)
        topStackView.frame = CGRect(x: topView.frame.width * 0.05, y:  topView.frame.height * 0.05, width: topView.frame.width * 0.9, height: topView.frame.height * 0.9)
        middleStackView.frame = CGRect(x: middleView.frame.width * 0.05, y:  middleView.frame.height * 0.05, width: middleView.frame.width * 0.9, height: middleView.frame.height * 0.9)
        bottomStackView.frame = CGRect(x: bottomView.frame.width * 0.05, y:  bottomView.frame.height * 0.05, width: bottomView.frame.width * 0.9, height: bottomView.frame.height * 0.9)
        scrollView.contentSize = CGSize(width: view.width, height: (cameraView.height + topView.height  + middleView.height  + bottomView.height) + 100)
    }
    
    // MARK: - Actions
    @objc func showOrHideButtonTapped() {
        showInfo.toggle()
        if showInfo {
            scrollView.isHidden = false
            buttonHideOrShow.setTitle("Hide Info", for: .normal)
        } else {
            scrollView.isHidden = true
            buttonHideOrShow.setTitle("Show Info", for: .normal)
        }
    }
    
    // MARK: - Functions
    func updateLableInfo() {
        // Location Info
        lblOperatorId.text = "Operator ID : "
        lblPropertyId.text = "Property ID : "
        lblFloor.text = "Floor : "
        lblZone.text = "Zone : "
        lblArea.text = "Area : "
        lblBank.text = "Bank : "
        lblPosition.text = "Position : "
        // Smith Board Info
        lblMachineNumber.text = "Machine Number : "
        lblFCTimeZoneId.text = "FC Time Zone Id : "
        lblSmithInfo.text = "Smith Info"
        lblVersion.text = "Version : "
        lblLastTimeBoardReset.text = "Last Time Board Reset : "
        lblNumberOfTimeBoardBeenReset.text = "Number Of Time Board Been Reset : "
        lblIsSASConnected.text = "Is SAS Connected : "
        lblIsSASMetersReported.text = "Is SAS Meters Reported : "
        lblIsSASTicketConfigSet.text = "Is SAS Ticket Config Set : "
        lblIsSASValidationIdSet.text = "Is SAS ValidationId Set : "
        lblConnectionIp.text = "Connection IP : "
        lblHowLongTillGetResponse.text = "How Long Till Get Response : "
        lblInternet.text = "Internet : "
        lblSignalStrength.text = "Signal Strength : "
        lblCurrentCardNumber.text = "Current Card Number : "
        lblCurrentUserName.text = "Current User Name : "
        // SNX info
        lblSnxExpirationDays.text = "Expiration Days : "
        lblSnxHostId.text = "Host ID : "
        lblSnxLocation.text = "Location : "
        lblSnxAddressLine1.text = "Address Line1 : "
        lblSnxAddressLine2.text = "Address Line2 : "
        lblSnxMachine.text = "Machine : "
    }
}

// MARK: - Extension
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
