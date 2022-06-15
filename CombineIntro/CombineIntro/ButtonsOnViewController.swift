//
//  ViewController.swift
//  CombineIntro
//
//  Created by M3ts LLC on 6/14/22.
//

import Combine
import UIKit

// MARK: - Custom Cell
class MyCustomTableCell: UITableViewCell {
    // MARK: - Properties
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let action = PassthroughSubject<String, Never>() // Combine
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        action.send("Cool ! Button was tapped !")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 3, width: contentView.frame.size.width - 20, height: contentView.frame.size.height - 6)
    }
}

// MARK: - UIViewController
class ButtonsOnViewController: UIViewController, UITableViewDataSource {
    // MARK: - Properties
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var observers: [AnyCancellable] = [] // Combine
    private var models = [String]()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        // MARK: - Combine
        APICaller.shared.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] value in
                self?.models = value
                self?.tableView.reloadData()
            }).store(in: &observers)
    }
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell else {
            return UITableViewCell()
        }
        // MARK: - Combine
        cell.action.sink { [weak self] string in
            print(string)
            let companyName =  self?.models[indexPath.row] ?? "Name Not Found!"
            self?.goToMessageIdVC(withMessage: companyName)
        }.store(in: &observers)
        
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func goToMessageIdVC(withMessage: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let  vc = storyboard.instantiateViewController(identifier:  "MessageIdStoryBoardId") as? MessageViewController {
            vc.companyName = withMessage
            present(vc, animated: true, completion: nil)
        }
    }
}

// MARK: - NOTE
/*
 The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.
 The Publisher protocol declares a type that can deliver a sequence of values over time. Publishers have operators to act on the values received from upstream publishers and republish them.
 At the end of a chain of publishers, a Subscriber acts on elements as it receives them. Publishers only emit values when explicitly requested to do so by subscribers. This puts your subscriber code in control of how fast it receives events from the publishers it’s connected to.
 Several Foundation types expose their functionality through publishers, including Timer, NotificationCenter, and URLSession. Combine also provides a built-in publisher for any property that’s compliant with Key-Value Observing.
 You can combine the output of multiple publishers and coordinate their interaction. For example, you can subscribe to updates from a text field’s publisher, and use the text to perform URL requests. You can then use another publisher to process the responses and use them to update your app.
 By adopting Combine, you’ll make your code easier to read and maintain, by centralizing your event-processing code and eliminating troublesome techniques like nested closures and convention-based callbacks.
 *** Source ***
 - https://www.youtube.com/watch?v=hbY1KTI0g70
 */

