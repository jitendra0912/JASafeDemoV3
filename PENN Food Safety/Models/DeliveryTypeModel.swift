//
//  DeliveryTypeModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 30/01/23.
//

import Foundation

struct DeliveryTypeModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: [DeliveryTypeData]?
    
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
struct DeliveryTypeData: Codable {
    let deliveryTypeID: Int?
    let deliveryTypeName: String?
    let minTemp, maxTemp, clientID: Int?
    let clientName: String?
    let createdOn: String?
    let createdBy: String?
    let createdByID: Int?
    let modifiedOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    
    enum CodingKeys: String, CodingKey {
        case deliveryTypeID = "DeliveryTypeID"
        case deliveryTypeName = "DeliveryTypeName"
        case minTemp = "MinTemp"
        case maxTemp = "MaxTemp"
        case clientID = "ClientID"
        case clientName = "ClientName"
        case createdOn = "CreatedOn"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case modifiedOn = "ModifiedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deliveryTypeID = try container.decodeWrapper(key: .deliveryTypeID, defaultValue: nil)
        self.deliveryTypeName = try container.decodeWrapper(key: .deliveryTypeName, defaultValue: nil)
        self.minTemp = try container.decodeWrapper(key: .minTemp, defaultValue: nil)
        self.maxTemp = try container.decodeWrapper(key: .maxTemp, defaultValue: nil)
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.clientName = try container.decodeWrapper(key: .clientName, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        
    }
}
