//
//  QRScannerViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 21/02/23.
//

import UIKit

struct QRData {
    var codeString: String?
}

class QRScannerViewController: BaseViewController {
    
    @IBOutlet weak var scannerViewTitleLabel: UILabel!
    @IBOutlet weak var qrScannerNextButton: UIButton!
    
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    @IBOutlet weak var scanButton: UIButton! {
        didSet {
            scanButton.setTitle("STOP", for: .normal)
        }
    }
    
    var qrData: QRData? = nil {
        didSet {
            if qrData != nil {
//                self.performSegue(withIdentifier: "detailSeuge", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.hide()
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        scannerViewTitleLabel.text = FSHelper.share.customListTitleName

    }
    
 
    @IBAction func qrScannerNextButtonPressed(_ sender: Any) {
        if isMoveToController() {
            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
        if !scannerView.isRunning {
            scannerView.startScanning()

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        sender.setTitle(buttonTitle, for: .normal)
    }
}


extension QRScannerViewController: QRScannerViewDelegate {
    
    func qrScanningDidStop() {
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        scanButton.setTitle(buttonTitle, for: .normal)
    }
    
    func qrScanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.qrData = QRData(codeString: str)
    }
}

