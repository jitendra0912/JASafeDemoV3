//
//  CorrectiveActionModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation

struct ResolvedReasonModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let data: [Datum]?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
        case count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)
        
    }
}

// MARK: - Datum
struct Datum: Codable {
    let reasonID: Int?
    let reasonText: String?
    let clientID: Int?
    let createdBy: String?
    let createdByID: Int?
    let createdOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    let modifiedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case reasonID = "ReasonID"
        case reasonText = "ReasonText"
        case clientID = "ClientID"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case createdOn = "CreatedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
        case modifiedOn = "ModifiedOn"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reasonID = try container.decodeWrapper(key: .reasonID, defaultValue: nil)
        self.reasonText = try container.decodeWrapper(key: .reasonText, defaultValue: nil)
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        
    }
}
