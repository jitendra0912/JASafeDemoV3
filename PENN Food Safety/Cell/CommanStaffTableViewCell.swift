//
//  CommanStaffTableViewCell.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 18/01/23.
//

import UIKit

class CommanStaffTableViewCell: UITableViewCell {

    @IBOutlet weak var staffLabel: UILabel!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var commanStaffBGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commanStaffBGView.layer.cornerRadius = 8.0
        self.circularView.layer.cornerRadius = self.circularView.bounds.height / 2
        


    }
    
    
    var staffViewModel: StaffViewModel! {
        didSet {
            
            self.staffLabel.text = staffViewModel.staffName
            
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            self.selectionStyle = .none
            commanStaffBGView.backgroundColor = #colorLiteral(red: 0, green: 0.3234525919, blue: 0.645539403, alpha: 1)
        } else {
            commanStaffBGView.backgroundColor = UIColor.white
        }
    }

}
