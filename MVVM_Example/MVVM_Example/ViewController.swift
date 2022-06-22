//
//  ViewController.swift
//  MVVM_Example
//
//  Created by M3ts LLC on 6/22/22.
//

import UIKit

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

/* Source :
 https://www.youtube.com/watch?v=iI0LabCYZJo
 */
