//
//  InformationViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 30/01/23.
//

import UIKit

class InformationViewController: BaseViewController {
    
    @IBOutlet weak var informationTextView: UITextView!
    @IBOutlet weak var informationTitleLabel: UILabel!
    @IBOutlet weak var informationNextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.updateMenuButton(type: .back)
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        informationTitleLabel.text = FSHelper.share.customListTitleName
        informationTextView.text = FSHelper.share.helpText
        informationTextView.adjustUITextViewHeight()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
        
    }
    
    @IBAction func informationNextButtonPressed(_ sender: Any) {
        self.isMoveToController()
        

    }
}

extension UITextView {
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
    }
}


