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
    
    
    // MARK: Properties
    var element: Element!

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Private Methods
    private func setupViews() {
        let imageNameStr = element.name.lowercased()
        let urlStr = "http://images-of-elements.com/\(imageNameStr).jpg"
        ImageHelper.shared.getImage(urlStr: urlStr) { (result) in
            switch result {
            case .success(let imageFromOnline):
                self.elementImage.image = imageFromOnline
            case .failure(let error):
                print(error)
            }
        }
    }
    


}
