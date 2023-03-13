//
//  ProductSupplierAPI.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 30/01/23.
//

import Foundation


struct ProductSupplierAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().productSupplier
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> ProductSupplierModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
