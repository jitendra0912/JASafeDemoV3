import Foundation

struct CabinetsModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let data: DataClass?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeWrapper(key: .isSuccess, defaultValue: nil)
        self.returnMessage = try container.decodeWrapper(key: .returnMessage, defaultValue: nil)
        self.data = try container.decodeWrapper(key: .data, defaultValue: nil)
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)
    }
}

// MARK: - DataClass
struct DataClass : Codable {
    let count: Int?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decodeWrapper(key: .count, defaultValue: nil)
        self.results = try container.decodeWrapper(key: .results, defaultValue: nil)
    }
    
}

// MARK: - Result
struct Result : Codable {
    let added: Bool?
    let address: Int?
    let child: Child?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let resultDescription: String?
    let enabled: Bool?
    let imei: String?
    let model: String?
    let resourceURI: String?
    let sensors: [ResultSensor]?
    let standalone: Bool?
    let subscribed: Bool?
    //    let subscribers: [String]?
    //    let tags: [String]?
    let timeout: Int?
    let unclearedAlarms: Int?
    let unitID: String?
    let unitOffline: Bool?
    let gateway: Gateway?
    
    enum CodingKeys: String, CodingKey {
        case added = "added"
        case address = "address"
        case child = "child"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case resultDescription = "description"
        case enabled = "enabled"
        case imei = "imei"
        case model = "model"
        case resourceURI = "resource_uri"
        case sensors = "sensors"
        case standalone = "standalone"
        case subscribed = "subscribed"
        //        case subscribers = "subscribers"
        //        case tags = "tags"
        case timeout = "timeout"
        case unclearedAlarms = "uncleared_alarms"
        case unitID = "unit_id"
        case unitOffline = "unit_offline"
        case gateway = "gateway"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.added = try container.decodeWrapper(key: .added, defaultValue: nil)
        self.address = try container.decodeWrapper(key: .address, defaultValue: nil)
        self.child = try container.decodeWrapper(key: .child, defaultValue: nil)
        self.controllable = try container.decodeWrapper(key: .controllable, defaultValue: nil)
        self.dashboardDisplay = try container.decodeWrapper(key: .dashboardDisplay, defaultValue: nil)
        self.resultDescription = try container.decodeWrapper(key: .resultDescription, defaultValue: nil)
        self.enabled = try container.decodeWrapper(key: .enabled, defaultValue: nil)
        self.imei = try container.decodeWrapper(key: .imei, defaultValue: nil)
        self.model = try container.decodeWrapper(key: .model, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        self.sensors = try container.decodeWrapper(key: .sensors, defaultValue: nil)
        self.standalone = try container.decodeWrapper(key: .standalone, defaultValue: nil)
        self.subscribed = try container.decodeWrapper(key: .subscribed, defaultValue: nil)
        self.timeout = try container.decodeWrapper(key: .timeout, defaultValue: nil)
        self.unclearedAlarms = try container.decodeWrapper(key: .unclearedAlarms, defaultValue: nil)
        self.unitID = try container.decodeWrapper(key: .unitID, defaultValue: nil)
        self.unitOffline = try container.decodeWrapper(key: .unitOffline, defaultValue: nil)
        self.gateway = try container.decodeWrapper(key: .gateway, defaultValue: nil)
    }
}

// MARK: - Child
struct Child : Codable {
    let unitID: String?
    let address: Int?
    let child: String?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let childDescription: String?
    let gateway: Gateway?
    let imei: String?
    let sensors: [ChildSensor]?
    let model: String?
    let standalone: Bool?
    let subscribed: Bool?
    let unitOffline: Bool?
    let unclearedAlarms: Int?
    let resourceURI: String?
    let added: Bool?
    let timeout: Int?
    let plot: String?
    //    let tags: [String]?
    let makemodel: String?
    //    let subscribers: [String]?
    let enabled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case unitID = "unit_id"
        case address = "address"
        case child = "child"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case childDescription = "description"
        case gateway = "gateway"
        case imei = "imei"
        case sensors = "sensors"
        case model = "model"
        case standalone = "standalone"
        case subscribed = "subscribed"
        case unitOffline = "unit_offline"
        case unclearedAlarms = "uncleared_alarms"
        case resourceURI = "resource_uri"
        case added = "added"
        case timeout = "timeout"
        case plot = "plot"
        //        case tags = "tags"
        case makemodel = "makemodel"
        //        case subscribers = "subscribers"
        case enabled = "enabled"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.unitID = try container.decodeWrapper(key: .unitID, defaultValue: nil)
        self.address = try container.decodeWrapper(key: .address, defaultValue: nil)
        self.child = try container.decodeWrapper(key: .child, defaultValue: nil)
        self.controllable = try container.decodeWrapper(key: .controllable, defaultValue: nil)
        self.dashboardDisplay = try container.decodeWrapper(key: .dashboardDisplay, defaultValue: nil)
        self.childDescription = try container.decodeWrapper(key: .childDescription, defaultValue: nil)
        self.gateway = try container.decodeWrapper(key: .gateway, defaultValue: nil)
        self.imei = try container.decodeWrapper(key: .imei, defaultValue: nil)
        self.sensors = try container.decodeWrapper(key: .sensors, defaultValue: nil)
        self.model = try container.decodeWrapper(key: .model, defaultValue: nil)
        self.standalone = try container.decodeWrapper(key: .standalone, defaultValue: nil)
        self.subscribed = try container.decodeWrapper(key: .subscribed, defaultValue: nil)
        self.unitOffline = try container.decodeWrapper(key: .unitOffline, defaultValue: nil)
        self.unclearedAlarms = try container.decodeWrapper(key: .unclearedAlarms, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        self.added = try container.decodeWrapper(key: .added, defaultValue: nil)
        self.timeout = try container.decodeWrapper(key: .timeout, defaultValue: nil)
        self.plot = try container.decodeWrapper(key: .plot, defaultValue: nil)
        self.makemodel = try container.decodeWrapper(key: .makemodel, defaultValue: nil)
        self.enabled = try container.decodeWrapper(key: .enabled, defaultValue: nil)
        
    }
}

// MARK: - Gateway
struct Gateway: Codable {
    let city: String?
    let countryName: String?
    let gatewayID: String?
    let ip: String?
    let premises: Premises?
    let regionName: String?
    let estimate: Bool?
    let interval: String?
    let resourceURI: String?
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case countryName = "country_name"
        case gatewayID = "gateway_id"
        case ip = "ip"
        case premises = "premises"
        case regionName = "region_name"
        case estimate = "estimate"
        case interval = "interval"
        case resourceURI = "resource_uri"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeWrapper(key: .city, defaultValue: nil)
        self.countryName = try container.decodeWrapper(key: .countryName, defaultValue: nil)
        self.gatewayID = try container.decodeWrapper(key: .gatewayID, defaultValue: nil)
        self.ip = try container.decodeWrapper(key: .ip, defaultValue: nil)
        self.premises = try container.decodeWrapper(key: .premises, defaultValue: nil)
        self.regionName = try container.decodeWrapper(key: .regionName, defaultValue: nil)
        self.estimate = try container.decodeWrapper(key: .estimate, defaultValue: nil)
        self.interval = try container.decodeWrapper(key: .interval, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
    }
}

// MARK: - Premises
struct Premises: Codable {
    let id: Int?
    let company: Int?
    let extendedAddress: String?
    let locality: String?
    let name: String?
    let postalCode: String?
    let region: Region?
    let streetAddress: String?
    let resourceURI: String?
    let slug: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case company = "company"
        case extendedAddress = "extended_Address"
        case locality = "locality"
        case name = "name"
        case postalCode = "postal_code"
        case region = "region"
        case streetAddress = "street_address"
        case resourceURI = "resource_uri"
        case slug = "slug"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeWrapper(key: .id, defaultValue: nil)
        self.company = try container.decodeWrapper(key: .company, defaultValue: nil)
        self.extendedAddress = try container.decodeWrapper(key: .extendedAddress, defaultValue: nil)
        self.locality = try container.decodeWrapper(key: .locality, defaultValue: nil)
        self.name = try container.decodeWrapper(key: .name, defaultValue: nil)
        self.postalCode = try container.decodeWrapper(key: .postalCode, defaultValue: nil)
        self.region = try container.decodeWrapper(key: .region, defaultValue: nil)
        self.streetAddress = try container.decodeWrapper(key: .streetAddress, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        self.slug = try container.decodeWrapper(key: .slug, defaultValue: nil)
        
    }
}

// MARK: - Region
struct Region: Codable {
    let country: String?
    let name: String?
    let resourceURI: String?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case name = "name"
        case resourceURI = "resource_uri"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decodeWrapper(key: .country, defaultValue: nil)
        self.name = try container.decodeWrapper(key: .name, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        
    }
}

// MARK: - ChildSensor
struct ChildSensor: Codable {
    let key: String?
    let sensorDescription: String?
    let enabled: Bool?
    let offset: Int?
    let unitID: String?
    let category: String?
    let resourceURI: String?
    let unitOfMeasurement: UnitOfMeasurement?
    let visible: Bool?
    let id: Int?
    let stalenessPeriod: Int?
    let reportInterval: Int?
    let minTemp: Double?
    let maxTemp: Double?
    let warningDelayMin: Int?
    let warningDelayMax: Int?
    let alarmDelayMin: Int?
    let alarmDelayMax: Int?
    let alarmRecoveryPeriodMin: Int?
    let alarmRecoveryPeriodMax: Int?
    let autoClear: Bool?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case sensorDescription = "sensor_description"
        case enabled = "enabled"
        case offset = "offset"
        case unitID = "unit_id"
        case category = "category"
        case resourceURI = "resource_uri"
        case unitOfMeasurement = "unit_of_measurement"
        case visible = "visible"
        case id = "id"
        case stalenessPeriod = "staleness_period"
        case reportInterval = "report_interval"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case warningDelayMin = "warning_delay_min"
        case warningDelayMax = "warning_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmDelayMax = "alarm_delay_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case autoClear = "auto_clear"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decodeWrapper(key: .key, defaultValue: nil)
        self.sensorDescription = try container.decodeWrapper(key: .sensorDescription, defaultValue: nil)
        self.enabled = try container.decodeWrapper(key: .enabled, defaultValue: nil)
        self.offset = try container.decodeWrapper(key: .offset, defaultValue: nil)
        self.unitID = try container.decodeWrapper(key: .unitID, defaultValue: nil)
        self.category = try container.decodeWrapper(key: .category, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        self.unitOfMeasurement = try container.decodeWrapper(key: .unitOfMeasurement, defaultValue: nil)
        self.visible = try container.decodeWrapper(key: .visible, defaultValue: nil)
        self.id = try container.decodeWrapper(key: .id, defaultValue: nil)
        self.stalenessPeriod = try container.decodeWrapper(key: .stalenessPeriod, defaultValue: nil)
        self.reportInterval = try container.decodeWrapper(key: .reportInterval, defaultValue: nil)
        self.minTemp = try container.decodeWrapper(key: .minTemp, defaultValue: nil)
        self.maxTemp = try container.decodeWrapper(key: .maxTemp, defaultValue: nil)
        self.warningDelayMin = try container.decodeWrapper(key: .warningDelayMin, defaultValue: nil)
        self.warningDelayMax = try container.decodeWrapper(key: .warningDelayMax, defaultValue: nil)
        self.alarmDelayMin = try container.decodeWrapper(key: .alarmDelayMin, defaultValue: nil)
        self.alarmDelayMax = try container.decodeWrapper(key: .alarmDelayMax, defaultValue: nil)
        self.alarmRecoveryPeriodMin = try container.decodeWrapper(key: .alarmRecoveryPeriodMin, defaultValue: nil)
        self.alarmRecoveryPeriodMax = try container.decodeWrapper(key: .alarmRecoveryPeriodMax, defaultValue: nil)
        self.autoClear = try container.decodeWrapper(key: .autoClear, defaultValue: nil)
    }
}

// MARK: - UnitOfMeasurement
struct UnitOfMeasurement: Codable {
    let umFull: String?
    let umAbbreviated: String?
    let umIndex: String?
    let umVariable: String?
    let key: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case umFull = "um_full"
        case umAbbreviated = "um_abbreviated"
        case umIndex = "um_index"
        case umVariable = "um_variable"
        case key = "key"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.umFull = try container.decodeWrapper(key: .umFull, defaultValue: nil)
        self.umAbbreviated = try container.decodeWrapper(key: .umAbbreviated, defaultValue: nil)
        self.umIndex = try container.decodeWrapper(key: .umIndex, defaultValue: nil)
        self.umVariable = try container.decodeWrapper(key: .umVariable, defaultValue: nil)
        self.key = try container.decodeWrapper(key: .key, defaultValue: nil)
        self.id = try container.decodeWrapper(key: .id, defaultValue: nil)
    }
}

// MARK: - ResultSensor
struct ResultSensor: Codable {
    let alarmDelayMax: Int?
    let alarmDelayMin: Int?
    let alarmRecoveryPeriodMax: Int?
    let alarmRecoveryPeriodMin: Int?
    let autoClear: Bool?
    let enabled: Bool?
    let id: Int?
    let key: String?
    let maxTemp: String?
    let minTemp: String?
    let offset: String?
    let reportInterval: Int?
    let resourceURI: String?
    let sensorDescription: String?
    let stalenessPeriod: Int?
    let unitID: String?
    let unitOfMeasurement: UnitOfMeasurement?
    let visible: Bool?
    let warningDelayMax: String?
    let warningDelayMin: String?
    let value: Value?
    
    enum CodingKeys: String, CodingKey {
        case alarmDelayMax = "alarm_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case autoClear = "auto_clear"
        case enabled = "enabled"
        case id = "id"
        case key = "key"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case offset = "offset"
        case reportInterval = "report_interval"
        case resourceURI = "resource_uri"
        case sensorDescription = "sensor_description"
        case stalenessPeriod = "staleness_period"
        case unitID = "unit_id"
        case unitOfMeasurement = "unit_of_measurement"
        case visible = "visible"
        case warningDelayMax = "warning_delay_max"
        case warningDelayMin = "warning_delay_min"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.alarmDelayMax = try container.decodeWrapper(key: .alarmDelayMax, defaultValue: nil)
        self.alarmDelayMin = try container.decodeWrapper(key: .alarmDelayMin, defaultValue: nil)
        self.alarmRecoveryPeriodMax = try container.decodeWrapper(key: .alarmRecoveryPeriodMax, defaultValue: nil)
        self.alarmRecoveryPeriodMin = try container.decodeWrapper(key: .alarmRecoveryPeriodMin, defaultValue: nil)
        self.autoClear = try container.decodeWrapper(key: .autoClear, defaultValue: nil)
        self.enabled = try container.decodeWrapper(key: .enabled, defaultValue: nil)
        self.id = try container.decodeWrapper(key: .id, defaultValue: nil)
        self.key = try container.decodeWrapper(key: .key, defaultValue: nil)
        self.maxTemp = try container.decodeWrapper(key: .maxTemp, defaultValue: nil)
        self.minTemp = try container.decodeWrapper(key: .minTemp, defaultValue: nil)
        self.offset = try container.decodeWrapper(key: .offset, defaultValue: nil)
        self.reportInterval = try container.decodeWrapper(key: .reportInterval, defaultValue: nil)
        self.resourceURI = try container.decodeWrapper(key: .resourceURI, defaultValue: nil)
        self.sensorDescription = try container.decodeWrapper(key: .sensorDescription, defaultValue: nil)
        self.stalenessPeriod = try container.decodeWrapper(key: .stalenessPeriod, defaultValue: nil)
        self.unitID = try container.decodeWrapper(key: .unitID, defaultValue: nil)
        self.unitOfMeasurement = try container.decodeWrapper(key: .unitOfMeasurement, defaultValue: nil)
        self.visible = try container.decodeWrapper(key: .visible, defaultValue: nil)
        self.warningDelayMax = try container.decodeWrapper(key: .warningDelayMax, defaultValue: nil)
        self.warningDelayMin = try container.decodeWrapper(key: .warningDelayMin, defaultValue: nil)
        self.value = try container.decodeWrapper(key: .value, defaultValue: nil)
    }
}

// MARK: - Value
struct Value: Codable {
    let value: Double?
    let unit: String?
    let sensor: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
        case sensor = "sensor"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeWrapper(key: .value, defaultValue: nil)
        self.unit = try container.decodeWrapper(key: .unit, defaultValue: nil)
        self.sensor = try container.decodeWrapper(key: .sensor, defaultValue: nil)
    }
}
