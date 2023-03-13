//
//  GetSupplierListModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation


struct GetSupplierListModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: GetSupplierListData?
    
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

// MARK: - DataClass
struct GetSupplierListData: Codable {
    let siteID: Int?
    let supplierList: [SupplierList]?
    let createdOn: String?
    let createdBy: String?
    let createdByID: Int?
    let modifiedOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    
    enum CodingKeys: String, CodingKey {
        case siteID = "SiteID"
        case supplierList = "SupplierList"
        case createdOn = "CreatedOn"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case modifiedOn = "ModifiedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.siteID = try container.decodeWrapper(key: .siteID, defaultValue: nil)
        self.supplierList = try container.decodeWrapper(key: .supplierList, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        
    }
}

// MARK: - SupplierList
struct SupplierList: Codable {
    let supplierID: Int?
    let supplierName: String?
    
    enum CodingKeys: String, CodingKey {
        case supplierID = "supplierID"
        case supplierName = "supplierName"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.supplierID = try container.decodeWrapper(key: .supplierID, defaultValue: nil)
        self.supplierName = try container.decodeWrapper(key: .supplierName, defaultValue: nil)
    }
}
