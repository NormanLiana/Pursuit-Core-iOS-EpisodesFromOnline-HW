//
//  ElementViewController.swift
//  Elements
//
//  Created by Liana Norman on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var elementTableView: UITableView!
    
    // MARK: Properties
    var elements = [Element]() {
        didSet {
            elementTableView.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        elementTableView.delegate = self
        elementTableView.dataSource = self
        loadData()
    }
    
    // MARK: Private Methods
    private func loadData() {
        ElementAPIManager.shared.getElements { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let elementsFromOnline):
                    self.elements = elementsFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}


// MARK: Extensions
extension ElementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = elementTableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementTableViewCell {
            let element = elements[indexPath.row]
           cell.elementName.text = element.name
            cell.elementSymbolNumberWeight.text = "\(element.symbol)(\(element.number) \(element.weight))"
            let elementNumber = ThumbnailImage.configureElementNumberForThumbnail(elementNumber: element.number)
            let urlStr = "http://www.theodoregray.com/periodictable/Tiles/\(elementNumber)/s7.JPG"
            ImageHelper.shared.getImage(urlStr: urlStr) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        cell.elementImage.image = imageFromOnline
                    }
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ElementViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
