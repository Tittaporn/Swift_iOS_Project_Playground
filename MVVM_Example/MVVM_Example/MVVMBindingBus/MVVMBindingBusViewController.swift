//
//  SecondViewController.swift
//  MVVM_Example
//
//  Created by M3ts LLC on 6/22/22.
//

import UIKit

class MVVMBindingBusViewController: UIViewController, UITableViewDataSource {
    private var viewModel = UserListBusViewModel()
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
        Bus.shared.subscribeOnMain(.userFetch) { [weak self] event in
            guard let result = event.result else {return}
            switch result{
            case .success(let users):
                self?.viewModel.users = users
                self?.tableView.reloadData()
            case .failure(let error):
                print("error --> \(error)")
            }
        }
        viewModel.fetchUserList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(viewModel.users[indexPath.row].username) \(viewModel.users[indexPath.row].email)"
        return cell
    }
}

/* Source :
 https://www.youtube.com/watch?v=jF4ZZhmfaPM
 */
