//
//  PhotoDetailTableViewCell.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 12/01/23.
//

import UIKit

class PhotoDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var photoDetailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}


class DynamicPhotoDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var weeklyCheckLabel: UILabel!
    @IBOutlet weak var dynamicBGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
