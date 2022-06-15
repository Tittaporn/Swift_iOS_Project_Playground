//
//  APICaller.swift
//  CombineIntro
//
//  Created by M3ts LLC on 6/14/22.
//

import Combine
import Foundation

// MARK: - API Caller
class APICaller {
    static let shared = APICaller()
    
    func fetchData() -> Future<[String], Error> {
        return Future { promixe in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                promixe(.success(["Apple", "Google", "Facebook", "Amazom", "Microsoft"]))
            }
        }
    }
}
