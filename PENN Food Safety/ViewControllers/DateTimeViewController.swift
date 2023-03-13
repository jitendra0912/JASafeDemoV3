//
//  DateTimeViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 23/02/23.
//

import UIKit

class DateTimeViewController: BaseViewController {

    @IBOutlet weak var dateTimeNextBtn: UIButton!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var dateTimeBGView: UIView!
    @IBOutlet weak var dateTimeTitleLabel: UILabel!
    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateTimeBGView.cornerRadius = 10
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        dateTimeTitleLabel.text = FSHelper.share.customListTitleName
        dateTextField.text = DateAsString()
        self.dateTextField.setDatePickerAsInputViewFor(target: self, selector: #selector(doneButtonTapped)) //1
    }
    
    @IBAction func dateTimeNextBtnPressed(_ sender: Any) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.updateMenuButton(type: .back)
    }
    
    func DateAsString() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE-MM-dd-yyyy"
        let str = dateFormatter.string(from: date as Date)
        return str
    }
    
    @objc func doneButtonTapped() {
        
        if dateTextField.isFirstResponder {
            if let datePicker = self.dateTextField.inputView as? UIDatePicker { // 2-1
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "EEEE-MM-dd-yyyy"
                dateTextField.text = dateFormatter.string(from: datePicker.date)
            }
        }
        
        self.view.endEditing(true)
    }
   
}
