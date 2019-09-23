//
//  EpisodesViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Liana Norman on 9/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var episodeTableView: UITableView!
    
    // MARK: Properties
    var show: ShowWrapper!
    var episode = [Episode]() {
        didSet {
            episodeTableView.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        loadData()
    }
    
    // MARK: Private Methods
    private func loadData() {
        EpisodeAPIClient.shared.getEpisodes(showID: String(show.show.id)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let episodesFromOnline):
                    self.episode = episodesFromOnline
                case .failure(let error):
                    print("What's happening?")
                    print(error)
                }
            }
        }
    }
}

// MARK: Extensions
extension EpisodesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension EpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cells = episodeTableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeTableViewCell {
            cells.episodeName.text = episode[indexPath.row].name
            cells.seasonAndEpisodeNumbers.text = episode[indexPath.row].seasonAndEpisode
            return cells
        }
        return UITableViewCell()
    }
    

}
