//
//  RequestMethod.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 21/01/23.
//

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

enum ApiEndpoints {
    case refrigeration(siteID:String, clientID:String)
   
    case alarm(siteID:String, clientID:String)
    
    case resolveReason(siteID:String, clientID:String)
    
    case correctiveAction(siteID:String, clientID:String)
    
    case postAlarm(siteID:String, clientID:String)
    
    case postViewLog(siteID:String, clientID:String)
    
    case moduleAPI(siteID:String, clientID:String)
    
    case staffAPI(siteID:String, clientID:String)
    
    case moduleInstruction(siteID:String, clientID:String)
    
    case customListByClientIDForMobileView(siteID:String, clientID:String)
    
    case deliveryType(siteID:String, clientID:String)
    
    case productSupplier(siteID:String, clientID:String)
    
    case getProductList(siteID:String, clientID:String)
    
    case getSupplierList(siteID:String, clientID:String)
    
}
extension ApiEndpoints {
    var endPoint: String {
        switch self {
        
        case .refrigeration(let sideID, _):
            return "\(baseURL)/refrigerationapi/Location/GetAllLocationDetailsBySiteID/\(sideID)"
        
        case .alarm(let sideID, _):
            return "\(baseURL)/NotificationAPI/Notification/GetAllNotificationsBySiteID/\(sideID)"
        
        case .resolveReason(_, let clientID):
            return "\(baseURL)/RefrigerationAPI/Reason/GetAllReasonsByClientID/\(clientID)"
        
        case .correctiveAction(_, let clientID):
            return "\(baseURL)/RefrigerationAPI/CorrectiveAction/GetAllCorrectiveActionsByClientID/\(clientID)"
        
        case .postAlarm:
            return "\(baseURL)/NotificationAPI/Notification/SaveNotification/"
        
        case .postViewLog(_, _):
            return "\(baseURL)/modulelogapi/ModuleLog/GetAllModuleLogsByDate/"
        
        case .moduleAPI(let sideID, _):
            return "\(baseURL)/siteapi/SiteModule/GetAllModulesBySiteID/\(sideID)"
        
        case .staffAPI(let sideID, _):
            return "\(baseURL)/siteapi/SiteStaff/GetAllStaffsBySiteID/\(sideID)"
        
        case .moduleInstruction:
            return "\(baseURL)/moduleapi/Module/GetModuleByID/"
        
        case .customListByClientIDForMobileView(_, let clientID):
            return "\(baseURL)/clientapi/ClientCustomList/GetCustomListByClientIDForMobileView/\(clientID)"
        
        case .deliveryType(_, let clientID):
            return "\(baseURL)/clientapi/ClientDeliveryType/GetAllDeliveryTypesByClientID/\(clientID)"
        
        case .productSupplier(_, let clientID):
            return "\(baseURL)/clientapi/ClientProductSupplier/GetAllProductSupplierMappingsByClientID/\(clientID)"
        
        case .getProductList(let sideID, _):
            return "\(baseURL)/siteapi/SiteProductSupplier/GetAllProductsBySiteID/\(sideID)"
     
        case .getSupplierList(let sideID, _):
            return "\(baseURL)/siteapi/SiteProductSupplier/GetAllSuppliersBySiteID/\(sideID)"
   
        }
    }
    
   
}

