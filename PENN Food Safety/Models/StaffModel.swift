//
//  StaffModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 16/01/23.
//

import Foundation

struct StaffModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: [StaffData]?
    let next, previous: String?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
        case data = "Data"
        case next, previous, count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.errorMessage = try container.decodeWrapper(key: .errorMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
        self.next = try container.decodeWrapper(key: .next, defaultValue: nil)
        self.previous = try container.decodeWrapper(key: .previous, defaultValue: nil)
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)
        
    }
}

// MARK: - Datum
struct StaffData: Codable {
    let staffID, siteID: Int?
    let staffName, pin: String?
    let createdOn: String?
    let createdBy: String?
    let createdByID: Int?
    let modifiedOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    
    enum CodingKeys: String, CodingKey {
        case staffID = "staffID"
        case siteID = "siteID"
        case staffName = "staffName"
        case pin = "pin"
        case createdOn = "createdOn"
        case createdBy = "createdBy"
        case createdByID = "createdByID"
        case modifiedOn = "modifiedOn"
        case modifiedBy = "modifiedBy"
        case modifiedByID = "modifiedByID"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.staffID = try container.decodeWrapper(key: .staffID, defaultValue: nil)
        self.siteID = try container.decodeWrapper(key: .siteID, defaultValue: nil)
        self.staffName = try container.decodeWrapper(key: .staffName, defaultValue: nil)
        self.pin = try container.decodeWrapper(key: .pin, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        
    }
    
}
