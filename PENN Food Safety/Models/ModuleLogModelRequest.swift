//
//  ModuleLogModelRequest.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 10/01/23.
//

import Foundation


struct LogModel : Codable {
    
    var clientID : String?
    var siteID : String?
    var moduleID : String?
    var statusID : Int?
    var fromDateTime : String?
    var toDateTime : String?
    var pageNo : Int?
    
    enum CodingKeys: String, CodingKey {
        case clientID = "ClientID"
        case siteID = "SiteID"
        case moduleID = "ModuleID"
        case statusID = "StatusID"
        case fromDateTime = "FromDateTime"
        case toDateTime = "ToDateTime"
        case pageNo = "PageNo"
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
//        self.siteID = try container.decodeWrapper(key: .siteID, defaultValue: nil)
//        self.moduleID = try container.decodeWrapper(key: .moduleID, defaultValue: nil)
//        self.statusID = try container.decodeWrapper(key: .statusID, defaultValue: nil)
//        self.fromDateTime = try container.decodeWrapper(key: .fromDateTime, defaultValue: nil)
//        self.toDateTime = try container.decodeWrapper(key: .toDateTime, defaultValue: nil)
//        self.pageNo = try container.decodeWrapper(key: .pageNo, defaultValue: nil)
//        
//    }
    
}

