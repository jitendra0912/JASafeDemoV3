//
//  DeliveryTypeViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation


class DeliveryTypeViewModel {
    
    var deliveryTypeID: Int?
    var deliveryTypeName: String?
    var minTemp: Int?
    var maxTemp: Int?
    var clientID: Int?
    var clientName: String?
    var createdOn: String?
    var createdBy: String?
    var createdByID: Int?
    var modifiedOn: String?
    var modifiedBy: String?
    var modifiedByID: Int?
    
    
    init(deliveryTypeData: DeliveryTypeData) {
        self.deliveryTypeID = deliveryTypeData.deliveryTypeID
        self.deliveryTypeName = deliveryTypeData.deliveryTypeName
        self.minTemp = deliveryTypeData.minTemp
        self.maxTemp = deliveryTypeData.maxTemp
        self.clientID = deliveryTypeData.clientID
        self.clientName = deliveryTypeData.clientName
        self.createdOn = deliveryTypeData.createdOn
        self.createdBy = deliveryTypeData.createdBy
        self.createdByID = deliveryTypeData.createdByID
        self.modifiedOn = deliveryTypeData.modifiedOn
        self.modifiedBy = deliveryTypeData.modifiedBy
        self.modifiedByID = deliveryTypeData.modifiedByID
        
    }
    
}


