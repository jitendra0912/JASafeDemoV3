//
//  SignatureViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 10/02/23.
//

import UIKit

class SignatureViewController: BaseViewController {
    
    var signatureManager: SignatureManager!
    
    @IBOutlet weak var signatureNextButton: UIButton!
    @IBOutlet weak var signatureTitleLabel: UILabel!
    @IBOutlet weak var buttonSaveSignature: UIButton!
    @IBOutlet weak var buttonClearSignature: UIButton!
    @IBOutlet weak var viewSignature: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        signatureTitleLabel.text = FSHelper.share.customListTitleName

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
        
    }
    
    @IBAction func signatureNextButtonPressed(_ sender: Any) {
        if isMoveToController() {
            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
        }else{
            loadController(instructionName:  FSHelper.share.loopInstructionTypeArray[FSHelper.share.controllerCount])
            self.setupLoopInstructionCustomMessageData(title: FSHelper.share.loopInstructionTypeArray[FSHelper.share.controllerCount - 1])


        }
        
    }
    @IBAction func clearSignatureTap() {
        viewSignature.clear()
    }
    
    @IBAction func saveSignatureTap() {
        
        guard let signatureImage = viewSignature.getSignature() else {
            return
        }
        
        //Signature Save in document Directory
        signatureManager = SignatureManager()
        signatureManager.signatureSaved = { (status, message) in
            print(message)
            if status {
                print("Varun")
                self.showAlertController("Signature Saved Successfully")
                self.viewSignature.clear()
                // Do further actions
            } else {
                print("Shukla")
            }
        }
        signatureManager.signature = signatureImage
    }
    
}

extension SignatureViewController: SignatureViewDelegate {
    func signatureViewDidTapInside(_ view: SignatureView) {
        self.signatureWritingDidStart()
    }
    
    func signatureViewDidPanInside(_ view: SignatureView) {
        self.signatureWritingDidStart()
    }
    
    private func signatureWritingDidStart() {
        buttonClearSignature.isHidden = false
        buttonSaveSignature.isHidden = false
    }
}
