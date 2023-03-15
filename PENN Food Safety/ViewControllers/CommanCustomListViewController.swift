//
//  CommanCustomListViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 29/01/23.
//

import Foundation
import UIKit

class CommanCustomListViewController: BaseViewController {
    
    @IBOutlet weak var commanCustomNextBtn: UIButton!
    @IBOutlet weak var commanInstructionTableView: UITableView!
    @IBOutlet weak var instructionListSearchBGView: JASearchBar!
    @IBOutlet weak var commanInstructionListLabel: UILabel!
    var deliveryTypeListName: String?
    
    var isSearching = false
    var productFilteredName = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        instructionListSearchBGView.delegate =  self

        self.updateMenuButton(type: .back)
        print(FSHelper.share.controllerCount)
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        instructionListSearchBGView.layer.cornerRadius = 16
        commanInstructionListLabel.text = FSHelper.share.customListTitleName



    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
    }
    
   
    @IBAction func commanCustomNextBtnPressed(_ sender: Any) {
        
    }
}

extension CommanCustomListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return productFilteredName.count
        } else {
            return FSHelper.share.productListViewModel.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommanCustomListTableViewCell", for: indexPath) as! CommanCustomListTableViewCell
        let productListViewModel = FSHelper.share.productListViewModel[indexPath.row]
//        cell.productListViewModel = productListViewModel
        
        
        
        if isSearching {
            cell.productListViewModel = productFilteredName[indexPath.row] as? ProductListViewModel
        } else {
            cell.productListViewModel = productListViewModel

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

extension CommanCustomListViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        productFilteredName = FSHelper.share.productListViewModel.filter({($0.productName!.lowercased().prefix(searchText.count)) == searchText.lowercased()})
        isSearching = true
        commanInstructionTableView.reloadData()
        
    }
    
}

