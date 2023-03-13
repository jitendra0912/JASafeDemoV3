//
//  AlarmModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 15/10/22.
//

import Foundation

struct AlarmModel : Codable {
    let isSuccess : Bool?
    let returnMessage : String?
    let errorMessage : String?
    let data : [DataM]?
    let next : String?
    let previous : String?
    let count : Int?

    enum CodingKeys: String, CodingKey {

        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
        case data = "Data"
        case next = "next"
        case previous = "previous"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.errorMessage = try container.decodeWrapper(key: .errorMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
        self.next = try container.decodeWrapper(key: .next, defaultValue: nil)
        self.previous = try container.decodeWrapper(key: .previous, defaultValue: nil)
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)
    }

}

struct DataM : Codable {
    let notificationID : Int?
    let notificationText : String?
    let notificationTypeID : Int?
    let notificationType : String?
    let siteID : Int?
    let clientID : Int?
    let areaID : Int?
    let roleID : Int?
    let isDismissed : Bool?
    let onClick : String?
    let raisedBy : String?
    let raisedOn : String?
    let reasonID : Int?
    var reasonText : String?
    let actionID : Int?
    var actionText : String?
    var remarks : String?
    let zetoAlarmID : Int?
    let cabinetID : String?
    let cabinetName : String?
    let sensorDescription : String?
    let sensorKey : String?
    let alarmType : String?
    let dismissedBy : String?
    let dismmisedOn : String?
    let comments : String?
    let isVerified : String?
    let title : String?

    enum CodingKeys: String, CodingKey {

        case notificationID = "NotificationID"
        case notificationText = "NotificationText"
        case notificationTypeID = "NotificationTypeID"
        case notificationType = "NotificationType"
        case siteID = "SiteID"
        case clientID = "ClientID"
        case areaID = "AreaID"
        case roleID = "RoleID"
        case isDismissed = "IsDismissed"
        case onClick = "OnClick"
        case raisedBy = "RaisedBy"
        case raisedOn = "RaisedOn"
        case reasonID = "ReasonID"
        case reasonText = "ReasonText"
        case actionID = "ActionID"
        case actionText = "ActionText"
        case remarks = "Remarks"
        case zetoAlarmID = "ZetoAlarmID"
        case cabinetID = "CabinetID"
        case cabinetName = "CabinetName"
        case sensorDescription = "SensorDescription"
        case sensorKey = "SensorKey"
        case alarmType = "AlarmType"
        case dismissedBy = "DismissedBy"
        case dismmisedOn = "DismmisedOn"
        case comments = "Comments"
        case isVerified = "IsVerified"
        case title = "Title"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notificationID = try container.decodeWrapper(key: .notificationID, defaultValue: nil)
        self.notificationText = try container.decodeWrapper(key: .notificationText, defaultValue: nil)
        self.notificationTypeID = try container.decodeWrapper(key: .notificationTypeID, defaultValue: nil)
        self.notificationType = try container.decodeWrapper(key: .notificationType, defaultValue: nil)
        self.siteID = try container.decodeWrapper(key: .siteID, defaultValue: nil)
        self.clientID = try container.decodeWrapper(key: .clientID, defaultValue: nil)
        self.areaID = try container.decodeWrapper(key: .areaID, defaultValue: nil)
        self.roleID = try container.decodeWrapper(key: .roleID, defaultValue: nil)
        self.isDismissed = try container.decodeWrapper(key: .isDismissed, defaultValue: nil)
        self.onClick = try container.decodeWrapper(key: .onClick, defaultValue: nil)
        self.raisedBy = try container.decodeWrapper(key: .raisedBy, defaultValue: nil)
        self.raisedOn = try container.decodeWrapper(key: .raisedOn, defaultValue: nil)
        self.reasonID = try container.decodeWrapper(key: .reasonID, defaultValue: nil)
        self.reasonText = try container.decodeWrapper(key: .reasonText, defaultValue: nil)
        self.actionID = try container.decodeWrapper(key: .actionID, defaultValue: nil)
        self.actionText = try container.decodeWrapper(key: .actionText, defaultValue: nil)
        self.remarks = try container.decodeWrapper(key: .remarks, defaultValue: nil)
        self.zetoAlarmID = try container.decodeWrapper(key: .zetoAlarmID, defaultValue: nil)
        self.cabinetID = try container.decodeWrapper(key: .cabinetID, defaultValue: nil)
        self.cabinetName = try container.decodeWrapper(key: .cabinetName, defaultValue: nil)
        self.sensorDescription = try container.decodeWrapper(key: .sensorDescription, defaultValue: nil)
        self.sensorKey = try container.decodeWrapper(key: .sensorKey, defaultValue: nil)
        self.alarmType = try container.decodeWrapper(key: .alarmType, defaultValue: nil)
        self.dismissedBy = try container.decodeWrapper(key: .dismissedBy, defaultValue: nil)
        self.dismmisedOn = try container.decodeWrapper(key: .dismmisedOn, defaultValue: nil)
        self.comments = try container.decodeWrapper(key: .comments, defaultValue: nil)
        self.isVerified = try container.decodeWrapper(key: .isVerified, defaultValue: nil)
        self.title = try container.decodeWrapper(key: .title, defaultValue: nil)
    }

}
