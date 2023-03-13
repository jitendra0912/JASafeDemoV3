//
//  CorrectiveActionModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation

struct CorrectiveActionModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let data: [Datumm]?
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
struct Datumm: Codable {
    let actionID: Int?
    let actionText: String?
    let reasonID, clientID: Int?
    let createdBy: String?
    let createdByID: Int?
    let createdOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    let modifiedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case actionID = "ActionID"
        case actionText = "ActionText"
        case reasonID = "ReasonID"
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
        self.actionID = try container.decodeWrapper(key: .actionID, defaultValue: nil)
        self.actionText = try container.decodeWrapper(key: .actionText, defaultValue: nil)
        self.reasonID = try container.decodeWrapper(key: .reasonID, defaultValue: nil)
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        
        
    }
}
