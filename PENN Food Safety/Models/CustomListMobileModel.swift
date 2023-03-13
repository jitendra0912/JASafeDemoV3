//
//  CustomListMobileViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 28/01/23.
//

import Foundation


struct CustomListMobileModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: [CustomListMobileViewData]?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.errorMessage = try container.decodeWrapper(key: .errorMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
    }
}

struct CustomListMobileViewData: Codable {
    let customListID: Int
    let customListName: String
    let customListType, itemCount: Int
    let itemDataList: [ItemDataList]?
    let clientID: Int
    let clientName: String
    let createdOn: String
    let createdBy: String
    let createdByID: Int
    let modifiedOn: String
    let modifiedBy: String
    let modifiedByID: Int

    enum CodingKeys: String, CodingKey {
        case customListID = "CustomListID"
        case customListName = "CustomListName"
        case customListType = "CustomListType"
        case itemCount = "ItemCount"
        case itemDataList = "ItemDataList"
        case clientID = "ClientID"
        case clientName = "ClientName"
        case createdOn = "CreatedOn"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case modifiedOn = "ModifiedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
    }
}

// MARK: - ItemDataList
struct ItemDataList: Codable {
    let itemID: Int
    let itemName: String
    
}
