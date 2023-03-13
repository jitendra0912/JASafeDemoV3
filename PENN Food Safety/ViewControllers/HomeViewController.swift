//
//  HomeViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var refrigerationCollectionView: UICollectionView!
    fileprivate var estimateWidth  = 160.0
    fileprivate var cellMarginSize  = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callStaffAPI()
        GetCustomListByClientIDForMobileView()
        getAllDeliveryType ()
        getProductSupplier ()
        getProductList ()
        getSupplierList ()
        // Menu Button Tint Color
        navigationController?.navigationBar.tintColor = .white
        //        self.view.backgroundColor = UIColor.blue
        //self.navigationController?.popToRootViewController(animated: true)
        FSHelper.share.callModuleAPI { response in
            DispatchQueue.main.async {
                self.refrigerationCollectionView.reloadData()
            }
        }
        
        refrigerationCollectionView.register(UINib.init(nibName: "RefrigerationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RefrigerationCellStatic")
        
        refrigerationCollectionView.delegate = self
        refrigerationCollectionView.dataSource = self
        refrigerationCollectionView.isUserInteractionEnabled = true
        self.setupGridView()
    }
    
    func setupGridView() {
        
        let flow = refrigerationCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Dashboard")
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            let item  = FSHelper.share._dynamicMenu
            return item.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: RefrigerationCollectionViewCell?
        if indexPath.section == 0 {
            let item = FSHelper.share._dynamicMenu
            let dynamicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RefrigerationCellDynamic", for: indexPath) as? RefrigerationCellDynamic
            dynamicCell!.setup(with: item[indexPath.row])
            return dynamicCell!
        }
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RefrigerationCellStatic", for: indexPath) as? RefrigerationCollectionViewCell
            cell?.setup(with: refrigerationData[indexPath.row])
            
        }
        return cell!
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(#function)
        // let padding: CGFloat =  40
        // let collectionViewSize = collectionView.frame.size.width - padding
        // return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select item")
        if indexPath.section == 0 {
            let commanStaffViewController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: CommanStaffViewController.self)) as! CommanStaffViewController
            NavigationHelper.helper.contentNavController?.pushViewController(commanStaffViewController, animated: true)
            let objSideMenu = FSHelper.share._dynamicMenu[indexPath.row]
            FSHelper.share.headerCustomListName = objSideMenu.title
            commanStaffViewController.modduleIDName = objSideMenu.moduleID!

        }else {
            let vc =   FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: SegementedVC.self)) as! SegementedVC
            NavigationHelper.helper.contentNavController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController {
    
    func calculateWith() -> CGFloat {
        let estimateWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
        
    }
}

 func callStaffAPI() {
    LoadingView.show()
    let request = StaffAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let staffData = model?.data {
                     FSHelper.share.staffData = (staffData.map({StaffViewModel(staffModel: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
            }
         }
    }

func GetCustomListByClientIDForMobileView () {
    LoadingView.show()
    let request = CustomListMobileViewAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let customListView = model?.data {
                     FSHelper.share.customListMobileData = (customListView.map({CustomListMobileViewModel(customListMobileModel: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
                 
            }
         }
    
}

func getAllDeliveryType () {
    LoadingView.show()
    let request = DeliveryTypeAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let deliveryTypes = model?.data {
                     print(deliveryTypes)
                     FSHelper.share.deliveryTypeViewModel = (deliveryTypes.map({DeliveryTypeViewModel(deliveryTypeData: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
            }
         }
    
}

func getProductSupplier () {
    LoadingView.show()
    let request = ProductSupplierAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let productSupplierData = model?.data {
                     print(productSupplierData)
                     FSHelper.share.productSupplierViewModel = (productSupplierData.map({ProductSupplierViewModel(productSupplierData: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
            }
         }
    
}

func getProductList () {
    LoadingView.show()
    let request = GetProductListAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let productListData = model?.data {
                     print(productListData)
                     FSHelper.share.productListViewModel = (productListData.productList!.map({ProductListViewModel(productList: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
            }
         }
    
}

func getSupplierList () {
    LoadingView.show()
    let request = GetSupplierListAPI()
    let apiLoader = APILoader(apiHandler: request)
    apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
             if let error = err {
                 print(error)
                 LoadingView.hide()
             } else {
                 if let supplierListData = model?.data {
                     print(supplierListData)
                     FSHelper.share.supplierListViewModel = (supplierListData.supplierList!.map({SupplierListViewModel(supplierList: $0)}))
                     DispatchQueue.main.async {
                         LoadingView.hide()
                     }
                 }
            }
         }
    
}


