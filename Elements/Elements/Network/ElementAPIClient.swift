//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Liana Norman on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class ElementAPIManager {
    private init() {}
    
    static let shared = ElementAPIManager()
    
    func getElements(completionHandler: @escaping (Result<[Element], AppError>) -> () ) {
        let urlStr = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let elementInfo = try JSONDecoder().decode([Element].self, from: data)
                    
                    completionHandler(.success(elementInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    func postElement(element: Element, completionHandler: @escaping (Result<Data, AppError>) -> () ) {
        
        guard let encodedData = try? JSONEncoder().encode(element) else {
            fatalError("encoder failed")
        }
        let urlStr = ""
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: .post) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    
}
