//
//  CustomListMobileViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 28/01/23.
//

import Foundation


class CustomListMobileViewModel {
    
    var customListID: Int?
    var customListName: String?
    var customListType: Int?
    var itemCount: Int?
    var itemDataList: [ItemDataList]?
    var clientID: Int?
    var clientName: String?
    var createdOn: String?
    var createdBy: String?
    var createdByID: Int?
    var modifiedOn: String?
    var modifiedBy: String?
    var modifiedByID: Int?
    
    // Dependency Injection (DI)
    init(customListMobileModel: CustomListMobileViewData) {
        
        self.customListID = customListMobileModel.customListID
        self.customListName = customListMobileModel.customListName
        self.customListType = customListMobileModel.customListType
        self.itemCount = customListMobileModel.itemCount
        self.itemDataList = customListMobileModel.itemDataList
        self.clientID = customListMobileModel.clientID
        self.clientName = customListMobileModel.clientName
        self.createdOn = customListMobileModel.createdOn
        self.createdBy = customListMobileModel.createdBy
        self.createdByID = customListMobileModel.createdByID
        self.modifiedOn = customListMobileModel.modifiedOn
        self.modifiedBy = customListMobileModel.modifiedBy
        self.modifiedByID = customListMobileModel.modifiedByID
        
        
    }
    
}
