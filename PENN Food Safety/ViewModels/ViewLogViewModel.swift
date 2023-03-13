//
//  ViewLogModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 11/01/23.
//

import Foundation
import UIKit

class ViewLogViewModel {
    
    var deleiveryType1: String?
    var dailyChecks: [String:String]?
    var weeklyChecks: [String:String]?
    var deleiveryType: String?
    var staffName: String?
    var dateCreatedOn: String?
    var dateSigneddOffOn: String?
    var dateSigneddOffBy: String?
    var temp: String?
    var entrydata: String?
    var LDR: String?
    var QRTest: String?
    var QRCode: String?
    var photo: [String]?

//    init(dataModel: DisplayOutputInstruction) {
        
//        self.staffName  =  dataModel.staff
//        
//        self.deleiveryType1  =  dataModel.deliveryType1
//        
//        self.dailyChecks  =  dataModel.dailyChecks
//        
//        self.weeklyChecks  =  dataModel.weeklyChecks
//
//        self.deleiveryType  =  dataModel.deliveryType
//
//        self.dateCreatedOn  =  dataModel.dateCreatedOn
//        
//        self.dateSigneddOffBy = dataModel.signedOffBy
//
//        self.dateSigneddOffOn  =  dataModel.dateSignedOffOn
//
//        self.temp  =  dataModel.temperature
//
//        self.entrydata  =  dataModel.entry4
//
//        self.LDR  =  dataModel.ldr
//        
//        self.QRTest  =  dataModel.qrTest
//        
//        self.QRCode  =  dataModel.QRCode1
//
//        self.photo = dataModel.photoPhoto
    
//    }
    
}

struct DetailsModel {
    
    var key: String
    var value: String
    
}



