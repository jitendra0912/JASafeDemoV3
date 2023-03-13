//
//  FSHelper.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import Foundation
import AppAuth

class FSHelper : NSObject {
  
    static let share = FSHelper()
    var alertDataM: DataM?
    var moduleLogViewModel = [ModuleLogViewModel]()
    var _dynamicMenu =  [SideMenuModel]()
    var staffData = [StaffViewModel] ()
    var customListMobileData = [CustomListMobileViewModel]()
    var instructionTypeArray = [String]()
    var headerCustomListName: String?
    var customListName: String?
    var moduleInstructionViewModel = [ModuleInstructionViewModel]()
    var productSupplierViewModel = [ProductSupplierViewModel]()
    var productListViewModel = [ProductListViewModel]()
    var supplierListViewModel = [SupplierListViewModel]()
    var deliveryTypeViewModel = [DeliveryTypeViewModel]()
    var isNumericKeyBoard: Bool?
    var helpText: String?
    var customListTitleName: String?
    var instructionTypeFilteredArray = [String]()
    var controllerCount:Int = 0
    var titleCount:Int = 0
    var isNextButtonEnabled = true
    var customisedListID: Int?
    
    var customisedTitleName: String?
    
    
    var loopInstructionTypeArray = [String]()
    
    var loopInstructionTitleTypeArray = [String]()



    private override init() {}
    
    func padBase64Encoded(_ base64Encoded: String) -> String {
        let remainder = base64Encoded.count % 4
        if remainder > 0 {
            return base64Encoded.padding(toLength: base64Encoded.count + 4 - remainder, withPad: "=", startingAt: 0)
        }
        return base64Encoded
    }
    
   func loadSlideMenu(forResource resourceName : String)-> NSArray?  {
      // Load menu from Plist
        if let path = Bundle.main.path(forResource: resourceName, ofType: "plist") {
            let items: NSArray = NSArray(contentsOfFile: path)!
            return items

        }
     return nil
    }
    
    func classFromString(_ className: String) -> AnyClass! {

        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleName"] as! String

        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!

        // return AnyClass!
        return cls
    }
    
    func getControllerFromPlist(titleName: String) -> [String:String]? {
      if let path = Bundle.main.path(forResource: "ModuleInstruction", ofType: "plist") {
          let url = URL(fileURLWithPath: path)
          let data = try! Data(contentsOf: url)
          let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
          let dictArray = plist as! [[String:String]]
          let objDict =  dictArray.filter({$0["name"] == titleName})[0]
          return objDict
          }
     return nil

    }
    
    
    func setAlermData(modelData:DataM?){
        self.alertDataM =  modelData
    }
    
    func callModuleAPI(success: @escaping (  _ response: [SideMenuModel]) -> ()) {
       LoadingView.show()
       let request = ModuleAPI()
       let apiLoader = APILoader(apiHandler: request)
       apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { [self] (model, err) in
           if let error = err {
               print(error)
               LoadingView.hide()
           } else {
               if let moduleData = model?.data {
                   self.moduleLogViewModel = (moduleData.moduleList.map({ModuleLogViewModel(moduleModel: $0)}))
                       LoadingView.hide()
                       success(makeDashhBoardDynamicMenu())
               }
           }
       }
   }
    
     func makeDashhBoardDynamicMenu() -> [SideMenuModel]  {
         _dynamicMenu.removeAll()
        for item in self.moduleLogViewModel {
            let dyObjct =  SideMenuModel(icon: item.moduleLogo!, moduleID: item.moduleID!, title: item.moduleName!, storyboard: "Main", controller: "commanController")
            _dynamicMenu.append(dyObjct)
        }
        return _dynamicMenu
    }
}

extension UIViewController {
    func showAlert(_ title: String, message: String, actions: [String], completion: @escaping ((String) -> Void)) {
        let controller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        for title in actions {
            controller.addAction(UIAlertAction.init(title: title, style: .default, handler: { _ in
                completion(title)
            }))
        }
        self.present(controller, animated: true, completion: nil)
    }
}

extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
    where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}

