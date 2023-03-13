//
//  GetProductModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation


struct GetProductModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: GetProductData?
    
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
struct GetProductData: Codable {
    let siteID, clientID: Int?
    let productList: [ProductList]?
    let createdOn: String?
    let createdBy: String?
    let createdByID: Int?
    let modifiedOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    
    enum CodingKeys: String, CodingKey {
        case siteID = "SiteID"
        case clientID = "ClientID"
        case productList = "ProductList"
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
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.productList = try container.decodeWrapper(key: .productList, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        
    }
}

// MARK: - ProductList
struct ProductList: Codable {
    let productID: Int?
    let productName: String?
    let defrostedDays, frozenDays, openedDays: Int?
    
    enum CodingKeys: String, CodingKey {
        case productID = "productID"
        case productName = "productName"
        case defrostedDays = "defrostedDays"
        case frozenDays = "frozenDays"
        case openedDays = "openedDays"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productID = try container.decodeWrapper(key: .productID, defaultValue: nil)
        self.productName = try container.decodeWrapper(key: .productName, defaultValue: nil)
        self.defrostedDays = try container.decodeWrapper(key: .defrostedDays, defaultValue: nil)
        self.frozenDays = try container.decodeWrapper(key: .frozenDays, defaultValue: nil)
        self.openedDays = try container.decodeWrapper(key: .openedDays, defaultValue: nil)
        
    }
    
}
