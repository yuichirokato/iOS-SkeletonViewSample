//
//  SampleTableViewCell.swift
//  SkeletonViewSample
//
//  Created by Takahashi Yuichiro on 2019/10/23.
//  Copyright © 2019 Takahashi Yuichiro. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        isSkeletonable = true
        userIconImageView.isSkeletonable = true
        userNameLabel.isSkeletonable = true
        descriptionLabel.isSkeletonable = true
        dateLabel.isSkeletonable = true
    }
}
