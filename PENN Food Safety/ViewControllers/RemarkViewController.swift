//
//  RemarkViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 15/11/22.
//

import UIKit

class RemarkViewController: BaseViewController {

    @IBOutlet weak var textViewRemark: UITextView!
    var _alrmModel: AlarmViewModel?
    var correctActionTitle: String?
    var reasonTitle: String?
    var alermModel = FSHelper.share.alertDataM

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewRemark.layer.cornerRadius = 8.0
        self.setNavigationTitle("Remark's")
        self.updateMenuButton(type: .back)
//        alermModel?.actionText = correctActionTitle

    }

    @IBAction func actionFiniesh(_ sender: UIButton) {
        let request = AlarmAPI()
        let apiLoader = APILoader(apiHandler: request)
        
        alermModel?.remarks  = self.textViewRemark.text
        alermModel?.actionText = correctActionTitle
        alermModel?.reasonText = reasonTitle
        
        apiLoader.postNotificationAPI(model:alermModel!) { response in
            print("response>>>>\(response)")
            
        } failure: { error in
            print("error>>>>\(error)")
        }
    }
}
