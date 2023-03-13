//
//  APIPath.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()
var siteID = String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)
var clientID = String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)
var path: String {
    return ""
}

struct APIPath {
    
    var refrigeration: String { return "\(baseURL)/refrigerationapi/Location/GetAllLocationDetailsBySiteID/" + (siteID)}
    var alarm: String { return "\(baseURL)/NotificationAPI/Notification/GetAllNotificationsBySiteID/" + (siteID)}
    var resolveReason: String { return "\(baseURL)/RefrigerationAPI/Reason/GetAllReasonsByClientID/" + (clientID)}
    var correctiveAction: String { return "\(baseURL)/RefrigerationAPI/CorrectiveAction/GetAllCorrectiveActionsByClientID/" + (clientID)}
    var postAlarm: String { return "\(baseURL)/NotificationAPI/Notification/SaveNotification"}
    var postViewLog: String { return "\(baseURL)/modulelogapi/ModuleLog/GetAllModuleLogsByDate"}
    var moduleAPI: String { return "\(baseURL)/siteapi/SiteModule/GetAllModulesBySiteID/" + (siteID)}
    var staffAPI: String { return "\(baseURL)/siteapi/SiteStaff/GetAllStaffsBySiteID/" + (siteID)}
    
    var moduleInstruction: String { return "\(baseURL)/moduleapi/Module/GetModuleByID/"}

    var customListByClientIDForMobileView: String { return "\(baseURL)/clientapi/ClientCustomList/GetCustomListByClientIDForMobileView/" + (clientID)}
    
    var deliveryType: String { return "\(baseURL)/clientapi/ClientDeliveryType/GetAllDeliveryTypesByClientID/" + (clientID)}
    
    var productSupplier: String { return "\(baseURL)/clientapi/ClientProductSupplier/GetAllProductSupplierMappingsByClientID/" + (clientID)}

    var getProductList: String { return "\(baseURL)/siteapi/SiteProductSupplier/GetAllProductsBySiteID/" + (siteID)}
    
    var getSupplierList: String { return "\(baseURL)/siteapi/SiteProductSupplier/GetAllSuppliersBySiteID/" + (siteID)}



    
    
}
