//
//  DeliveryTypesTableViewCell.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import UIKit

class DeliveryTypesTableViewCell: UITableViewCell {

    @IBOutlet weak var deliveryTypeLabel: UILabel!
    @IBOutlet weak var deliveryTypeBGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deliveryTypeBGView.layer.cornerRadius = 8.0

    }

   
    
    var deliveryTypeViewModel: DeliveryTypeViewModel! {
        didSet {
            
            deliveryTypeLabel.text = deliveryTypeViewModel.deliveryTypeName
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            self.selectionStyle = .none
            deliveryTypeBGView.backgroundColor = #colorLiteral(red: 0, green: 0.3234525919, blue: 0.645539403, alpha: 1)
        } else {
            deliveryTypeBGView.backgroundColor = UIColor.white
        }

    }


}
