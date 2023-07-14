//
//  FeedTableViewCell.swift
//  iOSCaseStudy
//
//  Created by Gaurav Sokhal on 13/07/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    // MARK: - IBoutlets
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
