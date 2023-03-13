//
//  CustomlistItemViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 06/03/23.
//

import Foundation


class CustomlistItemViewModel {
    
    var itemID: Int?
    var itemName: String?
    
    init(itemDataListModel: ItemDataList) {
        self.itemID =  itemDataListModel.itemID
        self.itemName =  itemDataListModel.itemName
    }
    
}
