//
//  customCellVC.swift
//  GOT-StudentVersion
//
//  Created by Chakane Shegog on 9/13/21.
//  Copyright © 2021 C4Q . All rights reserved.
//

import UIKit
class customCellVC: UITableViewCell {
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!

    
    func configureCell(for episode: GOTEpisode){
        episodeImageView.image = UIImage(named: "\(episode.mediumImageID)")
        titleLabel?.text = episode.name
        seasonLabel?.text = "season: \(episode.season), episode \(episode.number)"
    }

}
