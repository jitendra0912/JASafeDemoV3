//
//  StaffAPI.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 16/01/23.
//

import Foundation


struct StaffAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().staffAPI
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> StaffModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
