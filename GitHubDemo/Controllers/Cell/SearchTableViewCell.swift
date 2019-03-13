//
//  SearchTableViewCell.swift
//  GitHubDemo
//
//  Created by admin on 2/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

	static let id = "searchCell"

	@IBOutlet weak var starsCount: UILabel!
	@IBOutlet weak var repoNameLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	func setup(with repo: GitRepo) {
		starsCount.text = String(repo.stars)
		repoNameLabel.text = repo.name
	}
}
