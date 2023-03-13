//
//  SupplierListViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation


class SupplierListViewModel {
    
    var supplierID: Int?
    var supplierName: String?
   
    
    init(supplierList: SupplierList) {
        self.supplierID = supplierList.supplierID
        self.supplierName = supplierList.supplierName
     
    }
    
}

