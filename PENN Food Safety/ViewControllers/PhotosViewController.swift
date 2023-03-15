//
//  PhotosViewController.swift
//  FoodSafetyiOSMobileUI
//
//  Created by Varun Shukla on 21/02/23.
//

import UIKit
import AVFoundation

class PhotosViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photosNextButton: UIButton!
    @IBOutlet weak var photosButtonPressed: UIButton!
    @IBOutlet weak var photosImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle(FSHelper.share.headerCustomListName ?? "")
        photoTitleLabel.text = FSHelper.share.customListTitleName
        self.updateMenuButton(type: .back)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMenuButton(type: .back)
    }
    
    @IBAction func photoButtonTapped(_ sender: Any) {
        showActionSheet()
    }
    
    @IBAction func photosNextButtonPressed(_ sender: Any) {
//        if isMoveToController() {
//            loadController(instructionName:  FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount])
//            setupCustomMessageData(title: FSHelper.share.instructionTypeArray[FSHelper.share.controllerCount - 1])
//        }
        self.isMoveToController()
    }
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Selected Source Not Available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Select Image", message: "Select Image From", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.showImagePicker(selectedSource: .camera)
        }
        let libraryBtn = UIAlertAction(title: "Library", style: .default) { (_) in
            self.showImagePicker(selectedSource: .photoLibrary)
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cameraBtn)
        actionSheet.addAction(libraryBtn)
        actionSheet.addAction(cancelBtn)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photosImageView.image = selectedImage
        print(selectedImage)
        dismiss(animated: true, completion: nil)
    }
    
    func requestCameraPermission() {
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        let alert = UIAlertController(
            title: "Need Camera Access",
            message: "Camera access is required to make full use of this app.",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
            UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func checkCameraPermission() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraAuthorizationStatus {
        case .notDetermined:
        requestCameraPermission()
        case .authorized:
        showImagePicker(selectedSource: .camera)
        case .restricted, .denied: requestCameraPermission()
        }
    }
    
}
