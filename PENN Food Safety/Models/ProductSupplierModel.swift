//
//  ProductSupplierModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 30/01/23.
//

import Foundation


struct ProductSupplierModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: [ProductSupplierData]?
    
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

// MARK: - Datum
struct ProductSupplierData: Codable {
    let productID, supplierID: Int?
    let supplierName, productName: String?
    let createdBy: String?
    let createdByID: Int?
    let createdOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    let modifiedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case productID = "ProductID"
        case supplierID = "SupplierID"
        case supplierName = "SupplierName"
        case productName = "ProductName"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case createdOn = "CreatedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
        case modifiedOn = "ModifiedOn"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productID = try container.decodeWrapper(key: .productID, defaultValue: nil)
        self.supplierID = try container.decodeWrapper(key: .supplierID, defaultValue: nil)
        self.supplierName = try container.decodeWrapper(key: .supplierName, defaultValue: nil)
        self.productName = try container.decodeWrapper(key: .productName, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        
    }
}
