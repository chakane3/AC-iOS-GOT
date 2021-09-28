//
//  episodesDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Chakane Shegog on 9/28/21.
//  Copyright © 2021 C4Q . All rights reserved.
//

import UIKit

class episodesDetailViewController: UIViewController {
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeSummaryLabel: UILabel!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let episode = episode else {
            fatalError("nil found - prepare for segue")
        }
        navigationItem.title = episode.name
        episodeTitleLabel.text = episode.name
        episodeImageView.image = UIImage(named: "\(episode.mediumImageID)")
        episodeSummaryLabel.text = "Summary: \(episode.summary)"
    }

}
