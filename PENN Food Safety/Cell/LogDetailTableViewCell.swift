//
//  LogDetailTableViewCell.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 12/01/23.
//

import UIKit

class LogDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var deleiveryTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
