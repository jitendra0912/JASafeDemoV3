//
//  ModuleInstructionModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 27/01/23.
//

import Foundation

//struct ModuleInstructionModel: Codable {
//    let isSuccess: Bool?
//    let returnMessage: String?
//    let data: ModuleData?
//
//    enum CodingKeys: String, CodingKey {
//        case isSuccess = "IsSuccess"
//        case returnMessage = "ReturnMessage"
//        case data = "Data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
//        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
//        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
//    }
//}
//
//struct ModuleData: Codable {
//    let moduleID, moduleName, description: String?
//    let moduleType: Int?
//    let logo: String?
//    let clientID: Int?
//    let isActive, isPublished: Bool?
//    let instruction: [Instruction]?
//    let createdOn: String?
//    let createdBy: String?
//    let createdByID: Int?
//    let modifiedOn: String?
//    let modifiedBy: String?
//    let modifiedByID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case moduleID = "moduleID"
//        case moduleName = "moduleName"
//        case description = "description"
//        case moduleType = "moduleType"
//        case logo = "logo"
//        case clientID = "clientID"
//        case isActive = "isActive"
//        case isPublished = "isPublished"
//        case instruction = "instruction"
//        case createdOn = "createdOn"
//        case createdBy = "createdBy"
//        case createdByID = "createdByID"
//        case modifiedOn = "modifiedOn"
//        case modifiedBy = "modifiedBy"
//        case modifiedByID = "modifiedByID"
//
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.moduleID = try container.decodeWrapper(key: .moduleID, defaultValue: nil)
//        self.moduleName = try container.decodeWrapper(key: .moduleName, defaultValue: nil)
//        self.description = try container.decodeWrapper(key: .description, defaultValue: nil)
//        self.moduleType = try container.decodeWrapper(key: .moduleType, defaultValue: nil)
//        self.logo = try container.decodeWrapper(key: .logo, defaultValue: nil)
//        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
//        self.isActive = try container.decodeWrapper(key: .isActive, defaultValue: nil)
//        self.isPublished = try container.decodeWrapper(key: .isPublished, defaultValue: nil)
//        self.instruction = try container.decodeWrapper(key: .instruction, defaultValue: nil)
//        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
//        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
//        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
//        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
//        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
//        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
//
//    }
//}
//
//// MARK: - Instruction
//struct Instruction: Codable {
//    let instructionID: Int?
//    let instructionType: String?
//    let instructionTypeID: Int?
//    let uiType, instructionName: String?
//    let order: Int?
//    let message, helpText, listName: String?
//    let fieldText: String?
//    let isNumericField, isMultilineField, isSingleLineField: Bool?
//    let isOnlyDate, isOnlyTime, isOnlyDateTime: Bool?
//    let text: String?
//    let listID: Int?
//    let listType, filter: String?
//
//    enum CodingKeys: String, CodingKey {
//        case instructionID = "instructionID"
//        case instructionType = "instructionType"
//        case instructionTypeID = "instructionTypeID"
//        case uiType = "uiType"
//        case instructionName = "instructionName"
//        case order = "order"
//        case fieldText = "fieldText"
//        case text = "text"
//        case isNumericField = "isNumericField"
//        case isMultilineField = "isMultilineField"
//        case isSingleLineField = "isSingleLineField"
//        case isOnlyDate = "isOnlyDate"
//        case isOnlyTime = "isOnlyTime"
//        case isOnlyDateTime = "isOnlyDateTime"
//        case message = "message"
//        case helpText = "helpText"
//        case listName = "listName"
//        case listID = "listID"
//        case listType = "listType"
//        case filter = "filter"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.instructionID = try container.decodeWrapper(key: .instructionID, defaultValue: nil)
//        self.instructionType = try container.decodeWrapper(key: .instructionType, defaultValue: nil)
//        self.instructionTypeID = try container.decodeWrapper(key: .instructionTypeID, defaultValue: nil)
//        self.uiType = try container.decodeWrapper(key: .uiType, defaultValue: nil)
//        self.instructionName = try container.decodeWrapper(key: .instructionName, defaultValue: nil)
//        self.order = try container.decodeWrapper(key: .order, defaultValue: nil)
//        self.fieldText = try container.decodeWrapper(key: .fieldText, defaultValue: nil)
//        self.text = try container.decodeWrapper(key: .text, defaultValue: nil)
//        self.isNumericField = try container.decodeWrapper(key: .isNumericField, defaultValue: nil)
//        self.isMultilineField = try container.decodeWrapper(key: .isMultilineField, defaultValue: nil)
//        self.isSingleLineField = try container.decodeWrapper(key: .isSingleLineField, defaultValue: nil)
//        self.isOnlyDate = try container.decodeWrapper(key: .isOnlyDate, defaultValue: nil)
//        self.isOnlyTime = try container.decodeWrapper(key: .isOnlyTime, defaultValue: nil)
//        self.isOnlyDateTime = try container.decodeWrapper(key: .isOnlyDateTime, defaultValue: nil)
//        self.message = try container.decodeWrapper(key: .message, defaultValue: nil)
//        self.helpText = try container.decodeWrapper(key: .helpText, defaultValue: nil)
//        self.listName = try container.decodeWrapper(key: .listName, defaultValue: nil)
//        self.listID = try container.decodeWrapper(key: .listID, defaultValue: nil)
//        self.listType = try container.decodeWrapper(key: .listType, defaultValue: nil)
//        self.filter = try container.decodeWrapper(key: .filter, defaultValue: nil)
//    }
//}

/////////////////////////////   To Test  //////////////////////////
struct ModuleInstructionModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let data: ModuleData?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
    }
}

// MARK: - DataClass
struct ModuleData: Codable {
    let moduleID, moduleName, description: String?
    let moduleType: Int?
    let logo: String?
    let clientID: Int?
    let isActive, isPublished: Bool?
    let instruction: [Instruction]?
    let createdOn: String?
    let createdBy: String?
    let createdByID: Int?
    let modifiedOn: String?
    let modifiedBy: String?
    let modifiedByID: Int?
    
    enum CodingKeys: String, CodingKey {
        case moduleID = "moduleID"
        case moduleName = "moduleName"
        case description = "description"
        case moduleType = "moduleType"
        case logo = "logo"
        case clientID = "clientID"
        case isActive = "isActive"
        case isPublished = "isPublished"
        case instruction = "instruction"
        case createdOn = "createdOn"
        case createdBy = "createdBy"
        case createdByID = "createdByID"
        case modifiedOn = "modifiedOn"
        case modifiedBy = "modifiedBy"
        case modifiedByID = "modifiedByID"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.moduleID = try container.decodeWrapper(key: .moduleID, defaultValue: nil)
        self.moduleName = try container.decodeWrapper(key: .moduleName, defaultValue: nil)
        self.description = try container.decodeWrapper(key: .description, defaultValue: nil)
        self.moduleType = try container.decodeWrapper(key: .moduleType, defaultValue: nil)
        self.logo = try container.decodeWrapper(key: .logo, defaultValue: nil)
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.isActive = try container.decodeWrapper(key: .isActive, defaultValue: nil)
        self.isPublished = try container.decodeWrapper(key: .isPublished, defaultValue: nil)
        self.instruction = try container.decodeWrapper(key: .instruction, defaultValue: nil)
        self.createdOn = try container.decodeWrapper(key: .createdOn, defaultValue: nil)
        self.createdBy = try container.decodeWrapper(key: .createdBy, defaultValue: nil)
        self.createdByID = try container.decodeWrapper(key: .createdByID, defaultValue: nil)
        self.modifiedOn = try container.decodeWrapper(key: .modifiedOn, defaultValue: nil)
        self.modifiedBy = try container.decodeWrapper(key: .modifiedBy, defaultValue: nil)
        self.modifiedByID = try container.decodeWrapper(key: .modifiedByID, defaultValue: nil)
  
    }
}

// MARK: - Instruction
struct Instruction: Codable {
    let instructionID: Int?
    let instructionType: String?
    let instructionTypeID: Int?
    let uiType, instructionName: String?
    let order: Int?
    let message, helpText, listName: String?
    let loopInstructions: [LoopInstruction]?
    let fieldText: String?
    let isNumericField, isMultilineField, isSingleLineField: Bool?
    let isOnlyDate, isOnlyTime, isOnlyDateTime: Bool?
    let text: String?
    let listID: Int?
    let listType, filter: String?
    let userEmails: [String]?
    
    
    enum CodingKeys: String, CodingKey {
        case instructionID = "instructionID"
        case instructionType = "instructionType"
        case instructionTypeID = "instructionTypeID"
        case uiType = "uiType"
        case instructionName = "instructionName"
        case order = "order"
        
        case loopInstructions = "loopInstructions"

        case fieldText = "fieldText"
        case text = "text"
        case isNumericField = "isNumericField"
        case isMultilineField = "isMultilineField"
        case isSingleLineField = "isSingleLineField"
        case isOnlyDate = "isOnlyDate"
        case isOnlyTime = "isOnlyTime"
        case isOnlyDateTime = "isOnlyDateTime"
        case message = "message"
        case helpText = "helpText"
        
        case userEmails = "userEmails"

        case listName = "listName"
        case listID = "listID"
        case listType = "listType"
        case filter = "filter"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instructionID = try container.decodeWrapper(key: .instructionID, defaultValue: nil)
        self.instructionType = try container.decodeWrapper(key: .instructionType, defaultValue: nil)
        self.instructionTypeID = try container.decodeWrapper(key: .instructionTypeID, defaultValue: nil)
        self.uiType = try container.decodeWrapper(key: .uiType, defaultValue: nil)
        self.instructionName = try container.decodeWrapper(key: .instructionName, defaultValue: nil)
        self.order = try container.decodeWrapper(key: .order, defaultValue: nil)
        
        self.loopInstructions = try container.decodeWrapper(key: .loopInstructions, defaultValue: nil)

        self.fieldText = try container.decodeWrapper(key: .fieldText, defaultValue: nil)
        self.text = try container.decodeWrapper(key: .text, defaultValue: nil)
        self.isNumericField = try container.decodeWrapper(key: .isNumericField, defaultValue: nil)
        self.isMultilineField = try container.decodeWrapper(key: .isMultilineField, defaultValue: nil)
        self.isSingleLineField = try container.decodeWrapper(key: .isSingleLineField, defaultValue: nil)
        self.isOnlyDate = try container.decodeWrapper(key: .isOnlyDate, defaultValue: nil)
        self.isOnlyTime = try container.decodeWrapper(key: .isOnlyTime, defaultValue: nil)
        self.isOnlyDateTime = try container.decodeWrapper(key: .isOnlyDateTime, defaultValue: nil)
        self.message = try container.decodeWrapper(key: .message, defaultValue: nil)
        self.helpText = try container.decodeWrapper(key: .helpText, defaultValue: nil)
        
        self.userEmails = try container.decodeWrapper(key: .userEmails, defaultValue: nil)

        self.listName = try container.decodeWrapper(key: .listName, defaultValue: nil)
        self.listID = try container.decodeWrapper(key: .listID, defaultValue: nil)
        self.listType = try container.decodeWrapper(key: .listType, defaultValue: nil)
        self.filter = try container.decodeWrapper(key: .filter, defaultValue: nil)
    }
}

// MARK: - LoopInstruction
struct LoopInstruction: Codable {
    let instructionID: Int?
    let instructionType: String?
    let instructionTypeID: Int?
    let uiType, instructionName: String?
    let order: Int?
    let message, helpText, listName: String?
    let fieldText: String?
    let isNumericField, isMultilineField, isSingleLineField: Bool?
    let isOnlyDate, isOnlyTime, isOnlyDateTime: Bool?
    let text: String?
    let listID: Int?
    let listType, filter: String?
    
    
    enum CodingKeys: String, CodingKey {
        case instructionID = "instructionID"
        case instructionType = "instructionType"
        case instructionTypeID = "instructionTypeID"
        case uiType = "uiType"
        case instructionName = "instructionName"
        case order = "order"
        case fieldText = "fieldText"
        case text = "text"
        case isNumericField = "isNumericField"
        case isMultilineField = "isMultilineField"
        case isSingleLineField = "isSingleLineField"
        case isOnlyDate = "isOnlyDate"
        case isOnlyTime = "isOnlyTime"
        case isOnlyDateTime = "isOnlyDateTime"
        case message = "message"
        case helpText = "helpText"
        case listName = "listName"
        case listID = "listID"
        case listType = "listType"
        case filter = "filter"

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instructionID = try container.decodeWrapper(key: .instructionID, defaultValue: nil)
        self.instructionType = try container.decodeWrapper(key: .instructionType, defaultValue: nil)
        self.instructionTypeID = try container.decodeWrapper(key: .instructionTypeID, defaultValue: nil)
        self.uiType = try container.decodeWrapper(key: .uiType, defaultValue: nil)
        self.instructionName = try container.decodeWrapper(key: .instructionName, defaultValue: nil)
        self.order = try container.decodeWrapper(key: .order, defaultValue: nil)
        self.fieldText = try container.decodeWrapper(key: .fieldText, defaultValue: nil)
        self.text = try container.decodeWrapper(key: .text, defaultValue: nil)
        self.isNumericField = try container.decodeWrapper(key: .isNumericField, defaultValue: nil)
        self.isMultilineField = try container.decodeWrapper(key: .isMultilineField, defaultValue: nil)
        self.isSingleLineField = try container.decodeWrapper(key: .isSingleLineField, defaultValue: nil)
        self.isOnlyDate = try container.decodeWrapper(key: .isOnlyDate, defaultValue: nil)
        self.isOnlyTime = try container.decodeWrapper(key: .isOnlyTime, defaultValue: nil)
        self.isOnlyDateTime = try container.decodeWrapper(key: .isOnlyDateTime, defaultValue: nil)
        self.message = try container.decodeWrapper(key: .message, defaultValue: nil)
        self.helpText = try container.decodeWrapper(key: .helpText, defaultValue: nil)
        self.listName = try container.decodeWrapper(key: .listName, defaultValue: nil)
        self.listID = try container.decodeWrapper(key: .listID, defaultValue: nil)
        self.listType = try container.decodeWrapper(key: .listType, defaultValue: nil)
        self.filter = try container.decodeWrapper(key: .filter, defaultValue: nil)

    }
    
}

