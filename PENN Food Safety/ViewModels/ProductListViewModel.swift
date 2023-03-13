//
//  ProductListViewModel.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 31/01/23.
//

import Foundation

class ProductListViewModel {
    
    var productID: Int?
    var productName: String?
    var defrostedDays: Int?
    var frozenDays: Int?
    var openedDays: Int?
    
    init(productList: ProductList) {
        self.productID = productList.productID
        self.productName = productList.productName
        self.defrostedDays = productList.defrostedDays
        self.frozenDays = productList.frozenDays
        self.openedDays = productList.openedDays
        
        
    }
    
}
