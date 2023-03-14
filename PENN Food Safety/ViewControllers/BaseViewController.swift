//
//  BaseViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 28/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Crete NavigationTitle
    func setNavigationTitle(_ title: String) {
        NavigationHelper.helper.headerViewController?.labelTitle.text =  title
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func updateMenuButton(type:EMenuButtonType) {
        var imageBtn = UIImage()
        imageBtn = UIImage(named: type.rawValue)!
        NavigationHelper.helper.headerViewController?.menuType =  type
        NavigationHelper.helper.headerViewController?.btnMenu.setImage(imageBtn, for: UIControl.State())
    }
    
}

extension BaseViewController {
    func loadController(instructionName:String) {
        
        
        
        
        if instructionName == "Loop" {
                FSHelper.share.controllerCount = FSHelper.share.controllerCount + 1
            if let dict =  FSHelper.share.getControllerFromPlist(titleName: FSHelper.share.loopInstructionTypeArray[0]) {
                    if let controller =  NSClassFromString(SWIFT_CLASS_STRING(dict["Controller"] ?? "") ?? "") {
                        self.navigateToViewController(FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: controller)))
                    }
                }
        }
        else {
            FSHelper.share.controllerCount = FSHelper.share.controllerCount + 1
            if let dict =  FSHelper.share.getControllerFromPlist(titleName: instructionName) {
                if let controller =  NSClassFromString(SWIFT_CLASS_STRING(dict["Controller"] ?? "") ?? "") {
                    self.navigateToViewController(FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: controller)))
                }
            }
     }
        
        
        
        
        
        
      
    }
    
    func isMoveToController()->Bool {
        if (FSHelper.share.controllerCount <= (FSHelper.share.instructionTypeArray.count - 1)){
            return true
        }
        return false
    }
    
    func nextButtonEnabled()->Bool {
        if (FSHelper.share.controllerCount == (FSHelper.share.instructionTypeArray.count)) {
            FSHelper.share.isNextButtonEnabled = false
            return true
        }
        return false

    }
    
    private func navigateToViewController(_ viewController: UIViewController) {
        if (viewController.isKind(of: EntryInstructionViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: EntryInstructionViewController.self)) as! EntryInstructionViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: ModuleInstructionViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: ModuleInstructionViewController.self)) as! ModuleInstructionViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        } else if (viewController.isKind(of: CommanCustomListViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: CommanCustomListViewController.self)) as! CommanCustomListViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        } else if (viewController.isKind(of: InformationViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: InformationViewController.self)) as! InformationViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }   else if (viewController.isKind(of: SupplierListViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: SupplierListViewController.self)) as! SupplierListViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: DeliveryTypesViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: DeliveryTypesViewController.self)) as! DeliveryTypesViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        } else if (viewController.isKind(of: TemperatureViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: TemperatureViewController.self)) as! TemperatureViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: SignatureViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: SignatureViewController.self)) as! SignatureViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: QRScannerViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: QRScannerViewController.self)) as! QRScannerViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: PhotosViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: PhotosViewController.self)) as! PhotosViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }else if (viewController.isKind(of: DateTimeViewController.self)) {
            let aController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: DateTimeViewController.self)) as! DateTimeViewController
            NavigationHelper.helper.contentNavController!.pushViewController(aController, animated: true)
        }
    }
    
    func setupCustomMessageData(title: String?){
        if let title = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].instructionType {
            FSHelper.share.customListTitleName = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].message
            FSHelper.share.customisedListID = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].listID
            FSHelper.share.customisedTitleName = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].instructionType
            print(title)
            if FSHelper.share.customListTitleName == "Entry" {
                FSHelper.share.isNumericKeyBoard = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].isNumericField!
            }
            if title == "Information" {
                FSHelper.share.helpText = FSHelper.share.moduleInstructionViewModel[FSHelper.share.controllerCount - 1].text!
            }
        }
    }
    
    func setupLoopInstructionCustomMessageData(title: String?){

        if title == FSHelper.share.loopInstructionTypeArray[FSHelper.share.controllerCount - 1]{
            FSHelper.share.customListTitleName = FSHelper.share.loopInstructionTitleTypeArray[FSHelper.share.controllerCount - 1]
            
            print(title)

        }
    }
    
}
