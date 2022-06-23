//
//  ViewController.swift
//  MVVM_Example
//
//  Created by M3ts LLC on 6/22/22.
//

import UIKit

// MARK: - ObservableObject --> Take generic and listen to the change and bind when the value is changed, when only 1 listener and have not been use in this project, but reference from https://www.youtube.com/watch?v=sLHVxnRS75w
final class ObservableObject<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}

// MARK: - Obserable --> Take generic and listen to the change and bind when the value is changed.
class Observable<T> {
    var value: T? {
        didSet {
            listeners.forEach {
                $0(value)
            }
        }
    }
    init(_ value: T?) {
        self.value = value
    }
    
    private var listeners: [((T?) -> Void)] = []
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listeners.append(listener)
    }
}

// MARK: - Models
struct User: Codable {
    let name: String
    let username: String
    let email: String
}

// MARK: - ViewModels
struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
}

struct UserTableViewCellViewModel {
    let name: String
}

// MARK: - Controller
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var viewModel = UserListViewModel()
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        // To bind the users and update UI
        viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.users.value?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToBindingBusVC()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do {
                let userModels = try JSONDecoder().decode([User].self, from: data)
                self.viewModel.users.value = userModels.compactMap({ UserTableViewCellViewModel(name: $0.name)
                })
            }
            catch {
                print("Something wrong on fetching data...")
            }
        }
        task.resume()
    }
    
    func goToBindingBusVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  vc = storyboard.instantiateViewController(identifier: "SecondStoryBoardID")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
}

// MARK: - MVVM --> can be implement in many way in Switf forexample ObservableObject, Combine, Delegate,  Key-Value-Observing or RxSwift
/* Note : Making the ViewModel Dynamic

 Because your data will change, you need to make your ViewModel dynamic.

 What this means is that when the Model changes, ViewModel should change its public property values; it would propagate the change back to the view, which is the one that will update the UI.

 There are a lot of ways to do this.

 When Model changes, ViewModel gets notified first.

 You need some mechanism to propagate what changes up to the View.

 Some of the options include RxSwift, which is a pretty large library and takes some time to get used to.

 ViewModel could be firing NSNotifications on each property value change, but this adds a lot of code that needs additional handling, such as subscribing to notifications and unsubscribing when the view gets deallocated.

 Key-Value-Observing (KVO) is another option, but users will confirm that its API is not fancy.

 In this tutorial, you’ll use Swift generics and closures, which are nicely described in the Bindings, Generics, Swift and MVVM article.
 */

/* Source :
 https://www.youtube.com/watch?v=iI0LabCYZJo
 https://www.youtube.com/watch?v=sLHVxnRS75w
 https://www.youtube.com/watch?v=7HKi96v4X2A
 */
