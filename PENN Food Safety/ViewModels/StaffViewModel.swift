//
//  StaffViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 18/01/23.
//

import Foundation
import UIKit


class StaffViewModel {
    var staffName: String?
    var staffPin: String?
    
    
    // Dependency Injection (DI)
    init(staffModel: StaffData) {
        

        self.staffName = staffModel.staffName
        self.staffPin = staffModel.pin

}
    
}
