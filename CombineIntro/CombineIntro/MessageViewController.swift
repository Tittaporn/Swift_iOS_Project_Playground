//
//  MessageViewController.swift
//  CombineIntro
//
//  Created by M3ts LLC on 6/15/22.
//

import Combine
import UIKit

// MARK: - WeatherError
enum WeatherError: Error {
    case thingsJustHappen
}

// MARK: - Notification
extension Notification.Name {
    static let newMessage = Notification.Name("newMessage")
}

// MARK: - Message
struct Message {
    let content: String
    let author: String
}

// MARK: - MessageViewController
class MessageViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var allowMessageSwitch: UISwitch!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    // MARK: - Properties
    var companyName: String?
    @Published var canSendMessages: Bool = false
    private var switchSubscriber: AnyCancellable?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProcesscingChain()
        exampleOfCombine()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let companyName = companyName else { return }
        companyNameLabel.text = companyName
        allowMessageSwitch.isOn = canSendMessages
        
    }
    
    // MARK: - Actions
    @IBAction func didSwitch(_ sender: UISwitch) {
        canSendMessages = sender.isOn
    }
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
        let message = Message(content: "The current time is \(Date())", author: "Me")
        NotificationCenter.default.post(name: .newMessage, object: message)
    }
    
    // MARK: - Helper Functions
    func setupProcesscingChain() {
        switchSubscriber = $canSendMessages.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: sendButton)
        let messagePublisher = NotificationCenter.Publisher(center: .default, name: .newMessage)
            .map { notification -> String? in
                return (notification.object as? Message)?.content ?? ""
            }
        let messageSubscriber = Subscribers.Assign(object: messageLable, keyPath: \.text)
        messagePublisher.subscribe(messageSubscriber)
    }
    
    // MARK: - Example of Combine
    func exampleOfCombine() {
        // 1) Created weatherPublisher
        let weatherPublisher = PassthroughSubject<Int, WeatherError>() // PassthroughSubject<Int, Never>() || PassthroughSubject<Void, Never>()
        
        // 2) Created subscriber
        let subscriber = weatherPublisher
            .filter { $0 > 25 }
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished sinking")
                case .failure(let error):
                    print("Error : \(error)")
                }
            } receiveValue: { value in
                print("A summer day of \(value) C")
            }
        
        // 3) Created anotherSubscriber
        let anotherSubscriber = weatherPublisher.handleEvents(receiveSubscription: { subscription in
            print("New Subscription \(subscription)")
        }, receiveOutput: { output in
            print("New Value Output : \(output)")
        }, receiveCompletion:  { error in
            print("Subscription Completed with potential error \(error)")
        } , receiveCancel: {
            print("Subscription Cancelled")
        }).sink { completion in
            switch completion {
            case .finished:
                print("Finished sinking")
            case .failure(let error):
                print("Error : \(error)")
            }
        } receiveValue: { value in
            print("Subscription receieved value of \(value) C")
        }
        
        // 4) Called weatherPublisher
        weatherPublisher.send(10)
        weatherPublisher.send(20)
        weatherPublisher.send(24)
        weatherPublisher.send(26)
        weatherPublisher.send(28)
        weatherPublisher.send(30)
        weatherPublisher.send(completion: Subscribers.Completion<WeatherError>.failure(.thingsJustHappen))
        weatherPublisher.send(18)
    }
}

// MARK: - NOTE
/*
 *** Source ***
 - https://www.youtube.com/watch?v=RysM_XPNMTw
 */
