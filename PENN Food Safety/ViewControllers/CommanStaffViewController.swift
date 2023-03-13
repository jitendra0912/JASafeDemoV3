//
//  CommanStaffViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 18/01/23.
//

import UIKit

class CommanStaffViewController: BaseViewController {
    
    @IBOutlet weak var staffCommanTableView: UITableView!
    @IBOutlet weak var staffSearchBarBgView: JASearchBar!
//    var moduleInstructionViewModel = [ModuleInstructionViewModel]()
    let request = AlarmAPI()
    var moduleTitleName: String?
    var messageName: String?
    var isSearching = false
    var staffFilteredName = [Any]()
    var modduleIDName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        FSHelper.share.instructionTypeArray.removeAll()
        FSHelper.share.loopInstructionTypeArray.removeAll()
        
        staffSearchBarBgView.delegate =  self
        staffSearchBarBgView.layer.cornerRadius = 16
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.callModuleInstruction(moduleID: modduleIDName!){ (result) in
            if let moduleData = result.data {
                FSHelper.share.moduleInstructionViewModel = (moduleData.instruction?.map({ModuleInstructionViewModel(instructionModel: $0)}))!
            }
        }
        
    }
}

extension CommanStaffViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return staffFilteredName.count
        } else {
            return FSHelper.share.staffData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommanStaffTableViewCell", for: indexPath) as! CommanStaffTableViewCell
        if isSearching {
            cell.staffViewModel = staffFilteredName[indexPath.row] as? StaffViewModel
        } else {
            cell.staffViewModel = FSHelper.share.staffData[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let passCodeViewController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: PassCodeViewController.self)) as! PassCodeViewController
        passCodeViewController.validatePin = FSHelper.share.staffData[indexPath.row].staffPin
        
        FSHelper.share.instructionTypeArray = FSHelper.share.moduleInstructionViewModel.map({$0.instructionType!})
        print(FSHelper.share.instructionTypeArray)
        
        for (index, item) in FSHelper.share.moduleInstructionViewModel.enumerated() {
            if item.loopInstructions != nil {
                print("\(index). \(String(describing: item.loopInstructions!.count))")
                for (index, loopitem) in item.loopInstructions!.enumerated() {
                    print("\(index). \(String(describing: loopitem.instructionType!))")
                    FSHelper.share.loopInstructionTitleTypeArray.append(loopitem.message ?? "")
                    FSHelper.share.loopInstructionTypeArray.append(loopitem.instructionType!)
                }
            }
        }
        NavigationHelper.helper.contentNavController?.pushViewController(passCodeViewController, animated: true)
    }
}

extension CommanStaffViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        staffFilteredName = FSHelper.share.staffData.filter({($0.staffName!.lowercased().prefix(searchText.count)) == searchText.lowercased()})
        isSearching = true
        staffCommanTableView.reloadData()
        
    }
    
}
