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
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!
    @IBOutlet weak var elementWeight: UILabel!
    @IBOutlet weak var elementMelting: UILabel!
    @IBOutlet weak var elementBoiling: UILabel!
    
    
    // MARK: Properties
    var element: Element!

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: IBActions
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        let favorite = FavoriteElement(favoritedBy: "Liana", elementName: element.name, elementSymbol: element.symbol)
        ElementAPIManager.shared.postElement(element: favorite) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("We posted our favorite")
                case .failure(let error):
                    print(error)
                    
                }
            }
        }
    }
    
    // MARK: Private Methods
    private func setupViews() {
        self.navigationItem.title = element.name
        elementSymbol.text = element.symbol
        elementName.text = element.name
        elementNumber.text = element.number.description
        discoveredBy.text = "Discovered By: \(element.discoveredBy ?? "Information Unavailable")"
        elementBoiling.text = "Boiling Point: \(element.boilingPoint?.description ?? "Information Unavailable")"
        elementMelting.text = "Melting Point: \(element.meltingPoint?.description ?? "Information Unavailable")"
        elementWeight.text = element.weight.description
        let imageNameStr = element.name.lowercased()
        let urlStr = "http://images-of-elements.com/\(imageNameStr).jpg"
        switch self.element.number {
        case 1...89:
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
        case 90...118:
            self.elementImage.image = UIImage(named: "noIdea")
        default:
            print("Something is wrong with loading DVC Image")
        }
        
    }
    


}
