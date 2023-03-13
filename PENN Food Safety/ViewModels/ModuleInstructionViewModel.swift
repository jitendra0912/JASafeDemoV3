//
//  ModuleInstructionViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 27/01/23.
//

import Foundation


class ModuleInstructionViewModel {
    
    var instructionID: Int?
    var instructionType: String?
    var instructionTypeID: Int?
    var uiType: String?
    var instructionName: String?
    var order: Int?
    
    var loopInstructions: [LoopInstruction]?
    
    var message: String?
    var helpText: String?
    var listName: String?
    var listID: Int?
    var listType: String?
    var filter: String?
    var fieldText: String?
    var text: String?
    var isNumericField: Bool?
    var isMultilineField: Bool?
    var isSingleLineField: Bool?

    var userEmails: [String]?


    
    // Dependency Injection (DI)
    init(instructionModel: Instruction) {
       
        self.instructionID = instructionModel.instructionID
        self.instructionType = instructionModel.instructionType
        self.instructionTypeID = instructionModel.instructionTypeID
        self.uiType = instructionModel.uiType
        self.instructionName = instructionModel.instructionName
        self.order = instructionModel.order
        
        self.loopInstructions = instructionModel.loopInstructions
        
        self.fieldText = instructionModel.fieldText
        self.text = instructionModel.text
        self.isNumericField = instructionModel.isNumericField
        self.isMultilineField = instructionModel.isMultilineField
        self.isSingleLineField = instructionModel.isSingleLineField
        self.message = instructionModel.message
        self.helpText = instructionModel.helpText
        self.listName = instructionModel.listName
        self.listID = instructionModel.listID
        self.listType = instructionModel.listType
        self.filter = instructionModel.filter
        
        self.userEmails = instructionModel.userEmails
        
    
}
    
}


