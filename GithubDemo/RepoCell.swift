//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Eric Suarez on 1/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet {
            titleLabel.text = repo.name
            repoImageView.setImageWith(URL(string: repo.ownerAvatarURL!)!)
            authorLabel.text = repo.ownerHandle
            starCountLabel.text = "\(repo.stars!)"
            forkCountLabel.text = "\(repo.forks!)"
            descriptionLabel.text = repo.repoDescription
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
