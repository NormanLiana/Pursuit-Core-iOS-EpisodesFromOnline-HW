//
//  ShowAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Liana Norman on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

class ShowAPIClient {
    private init() {}
    
    static var shared = ShowAPIClient()
    let urlString = "http://api.tvmaze.com/search/shows?q=girls"
    func getShows(completionHandler: @escaping (Result<[ShowWrapper], AppError>) -> () ) {
        NetworkManager.shared.fetchData(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.badURL))
            case .success(let data):
                do {
                    let showInfo = try JSONDecoder().decode([ShowWrapper].self, from: data)
                    completionHandler(.success(showInfo))
                } catch {
                    completionHandler(.failure(.noDataError))
                }
                
            }
        }
    }
}
