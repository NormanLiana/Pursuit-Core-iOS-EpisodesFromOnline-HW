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
    func getShows(completionHandler: @escaping (Result<[String], AppError>) -> () ) {
        
    }
}
