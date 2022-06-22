//
//  UserListBusViewModel.swift
//  MVVM_Example
//
//  Created by M3ts LLC on 6/22/22.
//

import Foundation

struct UserListBusViewModel {
    public var users: [User] = []
    
    public func fetchUserList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            let event : UserFetchEvent
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                event = UserFetchEvent(identifier: UUID().uuidString, result: .success(users))
            }
            catch {
                print("Something wrong on fetching data... --> \(error)")
                event = UserFetchEvent(identifier: UUID().uuidString, result: .failure(error))
            }
            Bus.shared.publish(type: .userFetch, event: event)
        }
        task.resume()
    }
}
