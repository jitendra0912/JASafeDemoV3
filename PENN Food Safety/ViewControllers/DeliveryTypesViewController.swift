//
//  DeliveryTypesViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import UIKit

class DeliveryTypesViewController: BaseViewController {
    
    @IBOutlet weak var deliveryTypeNextButton: UIButton!
    @IBOutlet weak var deliveryTypeTableView: UITableView!
    @IBOutlet weak var deliveryTypeSearchBgView: JASearchBar!
    @IBOutlet weak var deliveryTypeTitleLabel: UILabel!
    
    var isSearching = false
    var deliveryListFilteredName = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.updateMenuButton(type: .back)
        deliveryTypeSearchBgView.delegate =  self

        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        deliveryTypeSearchBgView.layer.cornerRadius = 16
        deliveryTypeTitleLabel.text = FSHelper.share.customListTitleName

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(FSHelper.share.controllerCount)
        self.updateMenuButton(type: .back)

    }
    
    @IBAction func deliveryTypeNextButtonPressed(_ sender: Any) {
    }
    
    
}

extension DeliveryTypesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FSHelper.share.deliveryTypeViewModel.count
        if isSearching {
            return deliveryListFilteredName.count
        } else {
            return FSHelper.share.deliveryTypeViewModel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTypesTableViewCell", for: indexPath) as! DeliveryTypesTableViewCell
        let deliveryTypeViewModel = FSHelper.share.deliveryTypeViewModel[indexPath.row]
//        cell.deliveryTypeViewModel = deliveryTypeViewModel
        if isSearching {
            cell.deliveryTypeViewModel = deliveryListFilteredName[indexPath.row] as? DeliveryTypeViewModel
        } else {
            cell.deliveryTypeViewModel = deliveryTypeViewModel

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if isMoveToController() {
//            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
//            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
//        }else{
//            loadController(instructionName:  FSHelper.share.loopInstructionTypeArray[FSHelper.share.controllerCount])
//            self.setupLoopInstructionCustomMessageData(title: FSHelper.share.loopInstructionTypeArray[FSHelper.share.controllerCount - 1])
//
//        }
        self.isMoveToController()
    }
}

extension DeliveryTypesViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        deliveryListFilteredName = FSHelper.share.deliveryTypeViewModel.filter({($0.deliveryTypeName!.lowercased().prefix(searchText.count)) == searchText.lowercased()})
        isSearching = true
        deliveryTypeTableView.reloadData()
        
    }
    
}
