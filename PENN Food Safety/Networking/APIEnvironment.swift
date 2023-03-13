//
//  APIEnvironment.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
//        return "https://\(subdomain()).\(domain())"
        return "https://\(domain())"

    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "pcfsgateway-uat.azurewebsites.net"
        case .staging:
            return "pcfsgateway-uat.azurewebsites.net"
        case .production:
            return "pcfsgateway-uat.azurewebsites.net"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}
