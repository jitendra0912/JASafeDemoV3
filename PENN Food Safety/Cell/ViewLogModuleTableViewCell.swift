//
//  ViewLogModuleTableViewCell.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 11/01/23.
//

import UIKit

class ViewLogModuleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var staffDateCreated: UILabel!
    
    @IBOutlet weak var staffNameLabel: UILabel!
    
    @IBOutlet weak var viewLogBGView: UIView!
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewLogBGView.layer.cornerRadius = 16
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    let formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter
    }()
    
    
    var bindViewLogViewModel: ViewLogViewModel! {
        didSet {
            
            if let dates = bindViewLogViewModel.dateCreatedOn {
                staffDateCreated.text = convertDateFormater(dates)
                
            }
            self.staffNameLabel.text =  bindViewLogViewModel.staffName
        }
    }
    
    var detailsModel: DetailsModel! {
        didSet {
            self.staffNameLabel.text =  detailsModel.key
            self.staffDateCreated.text = detailsModel.value
        }
    }
    
    
    
    public func convertDateFormatter(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//this your string date format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        print(timeStamp)
        return timeStamp
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.formatOptions = [.withFractionalSeconds, .withTimeZone, .withInternetDateTime]
        let date = dateFormatter.date(from: date)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return  dateFormatter2.string(from: date!)
    }
}






