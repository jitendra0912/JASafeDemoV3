//
//  CommanCustomListTableViewCell.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 29/01/23.
//

import Foundation
import UIKit


class CommanCustomListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bGView: UIView!
    
    @IBOutlet weak var commonCustomlistlabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bGView.layer.cornerRadius = 8.0
        


    }
    
    var productListViewModel: ProductListViewModel! {
        didSet {
            
            commonCustomlistlabel.text = productListViewModel.productName
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            self.selectionStyle = .none
            bGView.backgroundColor = #colorLiteral(red: 0, green: 0.3234525919, blue: 0.645539403, alpha: 1)
        } else {
            bGView.backgroundColor = UIColor.white
        }

    }

}


    

