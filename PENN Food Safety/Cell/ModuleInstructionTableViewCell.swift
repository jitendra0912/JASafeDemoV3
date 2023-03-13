//
//  ModuleInstructionTableViewCell.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 27/01/23.
//

import UIKit

class ModuleInstructionTableViewCell: UITableViewCell {

    @IBOutlet weak var cancelCheckMarkBtn: UIButton!
    @IBOutlet weak var correctCheckMarkBtn: UIButton!
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var moduleInstructionBGView: UIView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moduleInstructionBGView.layer.cornerRadius = 8.0
        correctCheckMarkBtn.layer.cornerRadius = 0.5 * correctCheckMarkBtn.bounds.size.width
        correctCheckMarkBtn.clipsToBounds = true
        cancelCheckMarkBtn.layer.cornerRadius = 0.5 * cancelCheckMarkBtn.bounds.size.width
        cancelCheckMarkBtn.clipsToBounds = true

    }
    var customDataList: ItemDataList! {
        didSet {
            self.listNameLabel.text = customDataList.itemName
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       

    }

}
