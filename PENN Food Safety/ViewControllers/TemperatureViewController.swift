//
//  TemperatureViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import UIKit

class TemperatureViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var TemperatureNextButton: UIButton!
    @IBOutlet weak var TemperatureTextField: UITextField!
    @IBOutlet weak var TemperatureTitlelabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        TemperatureTextField.delegate = self
        TemperatureTitlelabel.text = FSHelper.share.customListTitleName
     
        if nextButtonEnabled() {
            TemperatureNextButton.isEnabled = false
            TemperatureNextButton.backgroundColor = #colorLiteral(red: 0.6627451181, green: 0.6627451181, blue: 0.6627451181, alpha: 1)
            TemperatureNextButton.setTitle("Finish", for: .normal)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
        
    }
    
    @IBAction func TemperatureNextButtonPressed(_ sender: Any) {
        if isMoveToController() {
            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty{
            TemperatureNextButton.isEnabled = true
            TemperatureNextButton.backgroundColor = #colorLiteral(red: 0, green: 0.3234525919, blue: 0.645539403, alpha: 1)
        } else {
            TemperatureNextButton.isEnabled = false
            TemperatureNextButton.backgroundColor = #colorLiteral(red: 0.6627451181, green: 0.6627451181, blue: 0.6627451181, alpha: 1)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TemperatureTextField.resignFirstResponder()
        return true;
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
