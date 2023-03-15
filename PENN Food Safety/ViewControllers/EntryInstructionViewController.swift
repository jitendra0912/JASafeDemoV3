//
//  EntryInstructionViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 30/01/23.
//

import UIKit

class EntryInstructionViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.updateMenuButton(type: .back)
        entryTitleLabel.text = FSHelper.share.customListTitleName
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        print(FSHelper.share.isNumericKeyBoard)
        entryTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
//        entryTextField.becomeFirstResponder()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Show keyboard by default
        entryTextField.becomeFirstResponder()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
//        if isMoveToController() {
//            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
//            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
//        }
        
        self.isMoveToController()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        entryTextField.resignFirstResponder()
        return true;
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}




