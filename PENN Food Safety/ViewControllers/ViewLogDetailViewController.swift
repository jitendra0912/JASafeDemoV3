//
//  ViewLogDetailViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 11/01/23.
//

import UIKit

class ViewLogDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var logDetailTableView: UITableView!
    
    var detailViewLogModel: ViewLogViewModel?
    var detailsModel = [DetailsModel]()
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logDetailTableView.delegate = self
        logDetailTableView.dataSource = self
        makeCustomDict()
        
        logDetailTableView.register(UINib(nibName: "ViewLogModuleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        logDetailTableView.register(UINib(nibName: "LogDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "Detailcell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Log Details")
        self.updateMenuButton(type: .back)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewLogModuleTableViewCell
        cell?.detailsModel = detailsModel[indexPath.row]
        if cell?.detailsModel.key == "Photo" || cell?.detailsModel.key == "Daily Checks" || cell?.detailsModel.key == "Weekly Checks" {
            cell?.nextImageView.isHidden = false
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoDetailVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: PhotoDetailViewController.self)) as! PhotoDetailViewController
        if detailsModel[indexPath.row].key == "Photo" {
            photoDetailVC.photoDetailArray = self.detailViewLogModel?.photo
            NavigationHelper.helper.contentNavController!.pushViewController(photoDetailVC, animated: true)
        }
        else if detailsModel[indexPath.row].key == "Daily Checks" {
            photoDetailVC.dailyChecksDict.removeAll()
            photoDetailVC.dailyChecksDict = (self.detailViewLogModel?.dailyChecks)!
            NavigationHelper.helper.contentNavController!.pushViewController(photoDetailVC, animated: true)

        }else if detailsModel[indexPath.row].key == "Weekly Checks" {
            photoDetailVC.dailyChecksDict.removeAll()
            photoDetailVC.dailyChecksDict = (self.detailViewLogModel?.weeklyChecks)!
            NavigationHelper.helper.contentNavController!.pushViewController(photoDetailVC, animated: true)
            print("abc")
        }
        
        
    }
    
    func convertDateFormater(_ date: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.formatOptions = [.withFractionalSeconds, .withTimeZone, .withInternetDateTime]
        let date = dateFormatter.date(from: date)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return  dateFormatter2.string(from: date!)
    }
    
    private func makeCustomDict() {
        if let abcd = self.detailViewLogModel?.photo {
            detailsModel.append(DetailsModel(key: "Photo", value: ""))
//            if abcd.count > 0 {
//                if let abc4 = self.detailViewLogModel?.dateSigneddOffOn {
//                    let timestampString = abc4
//                    let isoDateFormatter = ISO8601DateFormatter()
//                    if let date = isoDateFormatter.date(from: timestampString) {
//                        let dateFormatter = DateFormatter()
//                        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
//                        let dateFormattedString = dateFormatter.string(from: date)
//                        print(dateFormattedString)
//                        detailsModel.append(DetailsModel(key: "SigneddOffOn", value: dateFormattedString))
//                    } else {
//                        print("not a valid date")
//                    }
//                }
//                if let abc10 = self.detailViewLogModel?.dateSigneddOffBy {
//                    detailsModel.append(DetailsModel(key: "SigneddOffBy", value: abc10))
//                }
//            }
        } else if let dailyChks = self.detailViewLogModel?.dailyChecks{
            detailsModel.append(DetailsModel(key: "Daily Checks", value: ""))
        }else if let weeklyChks = self.detailViewLogModel?.weeklyChecks {
            detailsModel.append(DetailsModel(key: "Weekly Checks", value: ""))
        }
        if let abc = self.detailViewLogModel?.deleiveryType1 {
            detailsModel.append(DetailsModel(key: "Delivery Type 1", value: abc))
        }
        
        if let signedOffBy = self.detailViewLogModel?.dateSigneddOffBy {
            detailsModel.append(DetailsModel(key: "SigneddOffBy", value: signedOffBy))
            if let abc4 = self.detailViewLogModel?.dateSigneddOffOn {
                let timestampString = abc4
                let isoDateFormatter = ISO8601DateFormatter()
                if let date = isoDateFormatter.date(from: timestampString) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
                    let dateFormattedString = dateFormatter.string(from: date)
                    print(dateFormattedString)
                    detailsModel.append(DetailsModel(key: "SigneddOffOn", value: dateFormattedString))
                } else {
                    print("not a valid date")
                }
            }
        }
        
        if let abc1 = self.detailViewLogModel?.deleiveryType {
            detailsModel.append(DetailsModel(key: "Delivery Type", value: abc1))
        }
        if let abc2 = self.detailViewLogModel?.staffName {
            detailsModel.append(DetailsModel(key: "Staff", value: abc2))
        }
        if let abc3 = self.detailViewLogModel?.dateCreatedOn {
            let createdOnDate = convertDateFormater(abc3)
            detailsModel.append(DetailsModel(key: "CreatedOn", value: createdOnDate))
        }
        if let abc5 = self.detailViewLogModel?.temp {
            detailsModel.append(DetailsModel(key: "Temperature 1", value: abc5))
        }
        if let abc6 = self.detailViewLogModel?.entrydata {
            detailsModel.append(DetailsModel(key: "Entry 4", value: abc6))
        }
        if let abc7 = self.detailViewLogModel?.LDR {
            detailsModel.append(DetailsModel(key: "LDR", value: abc7))
        }
        if let abc8 = self.detailViewLogModel?.QRTest {
            detailsModel.append(DetailsModel(key: "QR test", value: abc8))
        }
        if let abc8 = self.detailViewLogModel?.QRCode {
            detailsModel.append(DetailsModel(key: "QR Code", value: abc8))
        }
        logDetailTableView.reloadData()
    }
    
    
}





