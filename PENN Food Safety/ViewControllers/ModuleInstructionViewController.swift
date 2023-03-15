//
//  ModuleInstructionViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 27/01/23.
//

import UIKit

class ModuleInstructionViewController: BaseViewController {
    
    @IBOutlet weak var moduleInstructionButton: UIButton!
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    @IBOutlet weak var moduleInstructionSearchView: JASearchBar!
    @IBOutlet weak var instructionListName: UILabel!
    var dictForButtonStaus = [[String:Bool]]()

    @IBOutlet weak var moduleInstructionTableView: UITableView!
    
    var cell: ModuleInstructionTableViewCell?
    var isSearching = false
    var moduleInstructionFilteredName = [Any]()
    var headerListName: String?
    var listName: String?
    var customListID: Int?
    var itemDataListArray = [ItemDataList]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        moduleInstructionSearchView.delegate =  self
        moduleInstructionTableView.estimatedRowHeight = 60

        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        moduleInstructionSearchView.layer.cornerRadius = 16
        heightConstraints.constant = 0
        LoadingView.hide()
        self.updateMenuButton(type: .back)
        self.instructionListName.text =  FSHelper.share.customListTitleName
        setUpData()
        
    }
    
    @objc func cancelCheckMarkBtnPressed(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let point = sender.convert(CGPoint.zero, to: moduleInstructionTableView)
        let indexValue = moduleInstructionTableView.indexPathForRow(at: point)
        guard let indxPath =  indexValue else  {
            return
        }
        self.dictForButtonStaus[indxPath.row]["isCorrectCheckStatus"] =  false
        self.dictForButtonStaus[indxPath.row]["isCancelCheckStstus"] =  true
        moduleInstructionTableView.reloadRows(at: [indxPath], with: .none)

        
    }
    @objc func correctCheckMarkBtnPressed(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        let point = sender.convert(CGPoint.zero, to: moduleInstructionTableView)
        let indexValue = moduleInstructionTableView.indexPathForRow(at: point)
     
        guard let indxPath =  indexValue else  {
            return
        }
        self.dictForButtonStaus[indxPath.row]["isCorrectCheckStatus"] =  true
        self.dictForButtonStaus[indxPath.row]["isCancelCheckStstus"] =  false
        moduleInstructionTableView.reloadRows(at: [indxPath], with: .none)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
        makeLocalDicForButtonStatus()
    }
    private func makeLocalDicForButtonStatus() {
        for _ in itemDataListArray {
            var tempDict = [String:Bool]()
             tempDict["isCorrectCheckStatus"] =  false
             tempDict["isCancelCheckStstus"] =  false
             self.dictForButtonStaus.append(tempDict)
        }
    }
    
    @IBAction func moduleInstructionButtonPressed(_ sender: Any) {
//        if isMoveToController() {
//            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
//            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
//        }
        self.isMoveToController()
    }
    
    func setUpData(){
        for (index, item) in FSHelper.share.customListMobileData.enumerated() {
            print("\(index). \(String(describing: item.customListID))")
            if FSHelper.share.customisedListID == item.customListID {
                if FSHelper.share.customisedTitleName == "Corrective actions" {
                    moduleInstructionSearchView.isHidden = true
                    self.itemDataListArray.append(contentsOf: item.itemDataList!)
                }
                else {
                    heightConstraints.constant = 50
                    moduleInstructionSearchView.isHidden = false
                    moduleInstructionButton.isHidden = true
                    self.itemDataListArray.append(contentsOf: item.itemDataList!)
                }
            }
            print(self.itemDataListArray.count)
        }
    }
}

extension ModuleInstructionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return moduleInstructionFilteredName.count
        } else {
            return itemDataListArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "ModuleInstructionTableViewCell", for: indexPath) as? ModuleInstructionTableViewCell
        
        if isSearching {
            cell!.customDataList = moduleInstructionFilteredName[indexPath.row] as? ItemDataList
        } else {
            cell!.customDataList = self.itemDataListArray[indexPath.row] as? ItemDataList

        }
        
        let myDict = self.dictForButtonStaus[indexPath.row]
               (myDict["isCorrectCheckStatus"] == true) ?  (cell!.correctCheckMarkBtn.backgroundColor = #colorLiteral(red: 0.167740792, green: 0.7454681993, blue: 0, alpha: 1)) : (cell!.correctCheckMarkBtn.backgroundColor =  #colorLiteral(red: 0.6627451181, green: 0.6627451181, blue: 0.6627451181, alpha: 1))
               (myDict["isCancelCheckStstus"] == true) ? (cell!.cancelCheckMarkBtn.backgroundColor = #colorLiteral(red: 0.9221704602, green: 0, blue: 0.1108471975, alpha: 1)) :  ( cell!.cancelCheckMarkBtn.backgroundColor =  #colorLiteral(red: 0.6627451181, green: 0.6627451181, blue: 0.6627451181, alpha: 1))
               
        cell!.correctCheckMarkBtn.addTarget(self, action: #selector(correctCheckMarkBtnPressed(sender:)), for: .touchUpInside)
        cell!.cancelCheckMarkBtn.addTarget(self, action: #selector(cancelCheckMarkBtnPressed(sender:)), for: .touchUpInside)
  
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if isMoveToController() {
//            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
//            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
//        }
        self.isMoveToController()
    }
}

extension ModuleInstructionViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        moduleInstructionFilteredName = self.itemDataListArray.filter({($0.itemName.lowercased().prefix(searchText.count)) == searchText.lowercased()})
        isSearching = true
        moduleInstructionTableView.reloadData()
        
    }
    
}
