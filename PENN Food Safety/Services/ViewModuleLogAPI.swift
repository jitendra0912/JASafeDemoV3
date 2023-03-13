//
//  ViewModuleLogAPI.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 10/01/23.
//

import Foundation


struct ViewModuleLogAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().postViewLog
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> AlarmModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
