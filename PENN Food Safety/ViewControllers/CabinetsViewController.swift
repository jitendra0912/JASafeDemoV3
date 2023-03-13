//
//  FirstViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 27/09/22.
//

import UIKit

class CabinetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cabinetTableview: UITableView!
    var cabinetViewModels = [CabinetViewModel]()
    let request = RefrigerationAPI() //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cabinetTableview.separatorStyle = .none
        cabinetTableview.delegate = self
        cabinetTableview.dataSource = self
        getCabinetFeed()
        
    }
    
    @IBAction func button(_ sender: Any) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cabinetViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CabinetCardTableViewCell", for: indexPath) as! CabinetCardTableViewCell
        let cabinetViewModel = self.cabinetViewModels[indexPath.row]
        cell.cabinetViewModel =  cabinetViewModel
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {          return 130
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let graphVC = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: JAGraphViewController.self)) as! JAGraphViewController
        graphVC.model =  self.cabinetViewModels[indexPath.row]
        LoadingView.show()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.callDefaultGraphApi(siteId:  String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int), unitID: (self.cabinetViewModels[indexPath.row].unitID)!){ (result) in
            
        }
        NavigationHelper.helper.contentNavController!.pushViewController(graphVC, animated: true)
        
    }
}


extension CabinetsViewController {
    
    private func getCabinetFeed() {
        LoadingView.show()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
            if let error = err {
                print(error)
                LoadingView.hide()
            } else {
                self.cabinetViewModels = (model?.data?.results!.map({CabinetViewModel(cabinetsModel: $0)}))!
                DispatchQueue.main.async {
                    LoadingView.hide()
                    self.cabinetTableview.reloadData()
                }
                
            }
        }
        
    }
}
