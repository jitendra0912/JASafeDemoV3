//
//  ProductSupplierViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation


class ProductSupplierViewModel {
    
    var productID: Int?
    var supplierID: Int?
    var supplierName: String?
    var productName: String?
    var createdBy: String?
    var createdByID: Int?
    var createdOn: String?
    var modifiedBy: String?
    var modifiedByID: Int?
    var modifiedOn: String?
    
    // Dependency Injection (DI)
    init(productSupplierData: ProductSupplierData) {
        
        self.productID = productSupplierData.productID
        self.supplierID = productSupplierData.supplierID
        self.supplierName = productSupplierData.supplierName
        self.productName = productSupplierData.productName
        self.createdBy = productSupplierData.createdBy
        self.createdByID = productSupplierData.createdByID
        self.createdOn = productSupplierData.createdOn
        self.modifiedBy = productSupplierData.modifiedBy
        self.modifiedByID = productSupplierData.modifiedByID
        self.modifiedOn = productSupplierData.modifiedOn
        
    }
    
}

