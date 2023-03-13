//
//  SideMenuModel.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

struct SideMenuModel {
    var icon: String?
    var moduleID: String?
    var title: String
    var storyboard: String
    var controller: String
    
    init(icon: String, moduleID: String, title: String, storyboard: String, controller: String) {
        self.icon = icon
        self.moduleID = moduleID
        self.title = title
        self.storyboard = storyboard
        self.controller = controller
    }
    
}

struct StaticSideMenuModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let errorMessage: String?
    let data: DataClassess?
    let next, previous: String?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
        case data = "Data"
        case next = "next"
        case previous = "previous"
        case count = "count"
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

// MARK: - DataClass
struct DataClassess: Codable {
    let siteID: Int
    let moduleList: [ModuleList]
    let isActive: Bool
    let createdOn: String
    let createdBy: String
    let createdByID: Int
    let modifiedOn: String
    let modifiedBy: String
    let modifiedByID: Int
}

// MARK: - ModuleList
struct ModuleList: Codable {
    let moduleID, moduleName, logo: String
    
    
}


