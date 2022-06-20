//
//  ViewController.swift
//  NFC_Reader
//
//  Created by M3ts LLC on 11/2/21.
//

import UIKit
import CoreNFC

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var textview: UITextView!
    
    // MARK: - Properties
    // var nfcSession: NFCNDEFReaderSession?
    var nfcTagReaderSession: NFCTagReaderSession?
    var word = "None"
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
      //  nfcTagReaderSession = NFCTagReaderSession(pollingOption: [.iso14443, .iso15693, .iso18092], delegate: self)
        nfcTagReaderSession = NFCTagReaderSession(pollingOption: .iso18092, delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Actions
    @IBAction func readingNFCTagTapped(_ sender: Any) {
        //        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        //        nfcSession?.alertMessage = "Hold your iPhone near the item to learn more about it."
        //        nfcSession?.begin()
        nfcTagReaderSession?.alertMessage = "Hold your iPhone near the item to learn more about it."
        nfcTagReaderSession?.begin()
        print("isReady: \(nfcTagReaderSession?.isReady)")
    }
}

// MARK: - NFCTagReaderSessionDelegate
extension ViewController: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Tag reader did become active")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("error \(error)")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("tags \(tags)")
        if tags.count > 1 {
            session.alertMessage = "More Than one Tag Detected, Please try again!"
            session.invalidate()
        }
        
        let tag = tags.first!
        session.connect(to: tag) { (error) in
            if nil != error {
                session.invalidate(errorMessage: "Connection Failed!")
            }
            if case let .miFare(sTag) = tag {
                let uuid = sTag.identifier.map {String(format: "%.2hhx", $0)}.joined()
                print("UID : \(uuid)")
                print(sTag.identifier)
                session.alertMessage = "UID Captured"
                session.invalidate()
                DispatchQueue.main.async {
                    self.textview.text = "\(uuid)"
                    
                }
            }
        }
    }
}

/*
// MARK: - NFCTagReaderSessionDelegate
extension ViewController: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("The session was invalidated : \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records {
            result += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8) ?? "Formate not supported"
        }
        DispatchQueue.main.async {
            self.textview.text = result
        }
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        session.restartPolling()
    }
}
*/
