//
//  CommanViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 20/12/22.
//

import UIKit

class CommanViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var viewLogTableView: UITableView!
    @IBOutlet weak var actionSheetBtn: UIButton!
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var fromDateTxtField: UITextField!
    var titleName: String?
    var moduleID: String?
//    private var staffData = [StaffData] ()


    var dateFormatter = DateFormatter()
    let currentDate = Date()
    private var daysDifference = -7
    var viewLogModel = [ViewLogViewModel]()


    var categories = ["Arun", "Shankar", "Subrat", "All"]

    var handlerSelectedCategory: ((Int) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle(titleName ?? "Comman View controller")
        
        self.fromDateTxtField.setDatePickerAsInputViewFor(target: self, selector: #selector(doneButtonTapped)) //1
        self.toDateTextField.setDatePickerAsInputViewFor(target: self, selector: #selector(doneButtonTapped)) //1
        
        let defaultFromDate = currentDate.addOrSubtructDay(day: -7)
        dateFormatter.dateFormat = "MM-dd-yyyy"
        fromDateTxtField.text = dateFormatter.string(from:defaultFromDate)
                
        let defaultToDate = currentDate.addOrSubtructDay(day: 0)
        dateFormatter.dateFormat = "MM-dd-yyyy"
        toDateTextField.text = dateFormatter.string(from:defaultToDate)
        
        viewLogTableView.register(UINib(nibName: "ViewLogModuleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        callViewLogAPI(fromDate: fromDateTxtField.text!, toDate: toDateTextField.text!)

        viewLogTableView.delegate = self
        viewLogTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func prepareActions(for title: String, index: Int) -> UIAlertAction {

        let alertAction = UIAlertAction(title: title, style: .default) { (action) in
            self.handlerSelectedCategory?(index)
        }

        return alertAction
    }

    @objc func presentActions() {

           let optionMenu = UIAlertController(title: "Select Staff", message: nil, preferredStyle: .actionSheet)
           // add dymamic options
        for (index, element) in FSHelper.share.staffData.enumerated() {
            optionMenu.addAction(prepareActions(for: FSHelper.share.staffData[index].staffName! , index: index))
           }
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
           optionMenu.addAction(cancelAction)

           handlerSelectedCategory = { index in
               self.actionSheetBtn.titleLabel?.text = FSHelper.share.staffData[index].staffName!
           }

           self.present(optionMenu, animated: true, completion: nil)
       }
    

    @IBAction func showStaffDetails(_ sender: Any) {
        self.presentActions()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewLogModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewLogModuleTableViewCell
        
        let viewLogModel = self.viewLogModel[indexPath.row]
        cell?.bindViewLogViewModel =  viewLogModel
        
        print(self.viewLogModel[indexPath.row].staffName)
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let logDetailVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: ViewLogDetailViewController.self)) as! ViewLogDetailViewController

        logDetailVC.detailViewLogModel = self.viewLogModel[indexPath.row]

        NavigationHelper.helper.contentNavController!.pushViewController(logDetailVC, animated: true)

        }
    
    @objc func doneButtonTapped() {
        
        if fromDateTxtField.isFirstResponder {
            if let datePicker = self.fromDateTxtField.inputView as? UIDatePicker { // 2-1
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "MM-dd-yyyy"
                fromDateTxtField.text = dateFormatter.string(from: datePicker.date)
            }
            
        }
        
        if toDateTextField.isFirstResponder {
            if let datePicker = self.toDateTextField.inputView as? UIDatePicker { // 2-1
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "MM-dd-yyyy"
                toDateTextField.text = dateFormatter.string(from: datePicker.date)
            }
            
        }
        
        callViewLogAPI(fromDate: fromDateTxtField.text!, toDate: toDateTextField.text!)
        
        self.view.endEditing(true)
    }

}


extension CommanViewController {
    
    private func callViewLogAPI(fromDate: String, toDate: String) {
        LoadingView.show()
        let request = ModuleAPI()
        let apiLoader = APILoader(apiHandler: request)
        
        let objc = LogModel(clientID: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int), siteID: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int), moduleID: self.moduleID! , statusID: 0, fromDateTime: fromDate, toDateTime: toDate, pageNo: 0)
            
            apiLoader.postViewLogAPI(model:objc) { response in
//                print("coutn Value>>>>\(response.dataa.count)")
                
//                if let feedData = response.dataa?.map({$0.displayOutputInstructions}) {
//                    self.viewLogModel = feedData[0].map({ViewLogViewModel(dataModel: $0)})
//
//                }
    

                DispatchQueue.main.async {
                    LoadingView.hide()
                    self.viewLogTableView.reloadData()
                }

              } failure: { error in
                  DispatchQueue.main.async {
                      LoadingView.hide()

                  self.viewLogModel.removeAll()
                  self.viewLogTableView.reloadData()
                  }
                }
    }
    
    
}

extension Array where Element: Hashable {
    func uniquelements() -> Array {
        var temp = Array()
        var s = Set<Element>()
        for i in self {
            if !s.contains(i) {
                temp.append(i)
                s.insert(i)
            }
        }
        return temp
    }
}


