//
//  PassCodeViewController.swift
//  Passcode
//
//  Created by Varun Shukla on 18/01/23.
//

import UIKit

class PassCodeViewController: BaseViewController {
    
    @IBOutlet weak var passCodeView: Passcode!
    var validatePin: String?
    var customListName: String?
    var instructionListId: Int?
    var instructionType: String?
    
    var indexItem: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle("Pin")
        print(FSHelper.share.instructionTypeArray.count)
        setupUI()
    }
    
    private func setupUI() {
        passCodeView.becomeFirstResponder()
        passCodeView.didFinishedEnterCode = {code in
            if code == self.validatePin {
                if self.isMoveToController() {
                    self.loadController(instructionName: FSHelper.share.instructionTypeArray[0])
                    self.setupCustomMessageData(title: FSHelper.share.instructionTypeArray[0])
                    self.passCodeView.code = ""
                } else {
//                    self.loadController(instructionName:  FSHelper.share.loopInstructionTypeArray[0])
//                    self.setupLoopInstructionCustomMessageData(title: FSHelper.share.loopInstructionTypeArray[0])


                }

                LoadingView.show()
            }else {
                self.showAlert("Error!", message: "Incorrect Pin", actions: ["Ok"]) { (actionTitle) in
                    self.passCodeView.code = ""
                }
            }
        }
    }
    
   
 
}


