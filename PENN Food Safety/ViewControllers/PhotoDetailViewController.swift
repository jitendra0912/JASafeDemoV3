//
//  PhotoDetailViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 12/01/23.
//

import UIKit

class PhotoDetailViewController: BaseViewController {
    
    @IBOutlet weak var photoDetailTblView: UITableView!
    
    var photoDetailArray: [String]?
    var dailyChecksDict = [String:String]()
    var objectArray = [Objects]()
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : String!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle("Photo")
        
        for (key, value) in dailyChecksDict {
            print(("\(key) -> \(value)"))
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
        
    }
    
}

extension PhotoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicPhotoDetailTableViewCell", for: indexPath) as! DynamicPhotoDetailTableViewCell
        
        cell.weeklyCheckLabel?.text = objectArray[indexPath.row].sectionName
        cell.statusLbl?.text = objectArray[indexPath.row].sectionObjects

        
        
        //        let url = NSURL(string:"Img-7d4f4484-b58c-4888-93e8-e859f14d892f-637981530264158600.Jpg")
        //            let imagedata = NSData.init(contentsOf: url! as URL)
        //
        //        if imagedata != nil {
        //            cell.photoDetailImageView.image = UIImage(data:imagedata! as Data)
        //        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}
