//
//  SupplierListViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import UIKit

class SupplierListViewController: BaseViewController {
    
    @IBOutlet weak var supplierListTableView: UITableView!
    @IBOutlet weak var supplierListNextBButton: UIButton!
    @IBOutlet weak var supplierListSearchBgView: JASearchBar!
    @IBOutlet weak var supplierListTitleLabel: UILabel!
    
    var isSearching = false
    var supplierFilteredName = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.updateMenuButton(type: .back)
        supplierListSearchBgView.delegate =  self
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        supplierListSearchBgView.layer.cornerRadius = 16
        supplierListTitleLabel.text = FSHelper.share.customListTitleName

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
    }
    
    @IBAction func supplierListNextBButtonPressed(_ sender: Any) {
    }
}

extension SupplierListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FSHelper.share.supplierListViewModel.count
        if isSearching {
            return supplierFilteredName.count
        } else {
            return FSHelper.share.supplierListViewModel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupplierListTableViewCell", for: indexPath) as! SupplierListTableViewCell
        let supplierListViewModel = FSHelper.share.supplierListViewModel[indexPath.row]
//        cell.supplierListViewModel = supplierListViewModel
        if isSearching {
            cell.supplierListViewModel = supplierFilteredName[indexPath.row] as? SupplierListViewModel
        } else {
            cell.supplierListViewModel = supplierListViewModel

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
//        }
        self.isMoveToController()
    }
}

extension SupplierListViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        supplierFilteredName = FSHelper.share.supplierListViewModel.filter({($0.supplierName!.lowercased().prefix(searchText.count)) == searchText.lowercased()})
        isSearching = true
        supplierListTableView.reloadData()
        
    }
    
}

