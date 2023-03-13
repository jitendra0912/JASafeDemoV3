//
//  ModuleLogViewModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 07/12/22.
//


import Foundation
import UIKit

class ModuleLogViewModel {
    
    var moduleName: String?
    var moduleLogo: String?
    var moduleID: String?

   
    init(moduleModel: ModuleList) {
        
        self.moduleName = moduleModel.moduleName
        self.moduleLogo = moduleModel.logo
        self.moduleID = moduleModel.moduleID

       
    }

}





