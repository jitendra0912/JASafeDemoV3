//
//  ViewLogModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 11/01/23.
//

import Foundation

struct ViewLogModel: Decodable {
    let isSuccess: Bool?
    let returnMessage: String?
    var dataa: [DataModel]?
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case dataa = "Data"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.dataa = try container.decodeWrapper(key: .dataa, defaultValue: nil)
        
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)

    }
}

// MARK: - Datum
struct DataModel: Decodable {
    let moduleName: String?
    let siteID: Int?
    let moduleID: String?
    let moduleType, counts, previousPageNo, nextPageNo: Int?
    let isVerified: Bool?
    let instructionsMenuItem: [[String]]?
    let displayOutputInstructions: [DisplayOutputInstruction]
    let photoList: [String]?

}

// MARK: - DisplayOutputInstruction

struct DisplayOutputInstruction: Decodable {

    var values = [String:[AnyObject]]()

    private enum CodingKeys: String, CodingKey {

        case values
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        values = [String:[AnyObject]]()
        let subContainer = try container.nestedContainer(keyedBy: GenericCodingKeys.self, forKey: .values)
        for key in subContainer.allKeys {
//            values[key.stringValue] = try subContainer.decode(String.self, forKey: key)
        }
    }
    
}

struct GenericCodingKeys: CodingKey {
    var intValue: Int?
    var stringValue: String

    init?(intValue: Int) { self.intValue = intValue; self.stringValue = "\(intValue)" }
    init?(stringValue: String) { self.stringValue = stringValue }

    static func makeKey(name: String) -> GenericCodingKeys {
        return GenericCodingKeys(stringValue: name)!
    }
}


