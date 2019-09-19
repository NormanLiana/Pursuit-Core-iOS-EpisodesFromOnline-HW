//
//  DetailElementViewController.swift
//  Elements
//
//  Created by Liana Norman on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailElementViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var navBarTitle: UINavigationBar!
    
    // MARK: Properties
    var element: Element!

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Private Methods
    private func setupViews() {
        self.navigationItem.title = element.name
        let imageNameStr = element.name.lowercased()
        let urlStr = "http://images-of-elements.com/\(imageNameStr).jpg"
        ImageHelper.shared.getImage(urlStr: urlStr) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let imageFromOnline):
                    self.elementImage.image = imageFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    


}
