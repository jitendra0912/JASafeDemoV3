//
//  SupplierListTableViewCell.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import UIKit

class SupplierListTableViewCell: UITableViewCell {

    @IBOutlet weak var supplierListLabel: UILabel!
    @IBOutlet weak var supplierListBGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        supplierListBGView.layer.cornerRadius = 8.0

    }

  
    
    
    var supplierListViewModel: SupplierListViewModel! {
        didSet {
            
            supplierListLabel.text = supplierListViewModel.supplierName
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            self.selectionStyle = .none
            supplierListBGView.backgroundColor = #colorLiteral(red: 0, green: 0.3234525919, blue: 0.645539403, alpha: 1)
        } else {
            supplierListBGView.backgroundColor = UIColor.white
        }

    }

}
