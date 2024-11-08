//
//  BackVC.swift
//  SpendPay
//
//  Created by Juda Escalera on 19/02/21.
//  Copyright © 2021 Juda Escalera. All rights reserved.
//

import UIKit
//import AppItFramework_IdFace
import IDentityLiteSDK

class BackVC: BaseIdMissionVC {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var viewImg: UIView!
    @IBOutlet weak var lbTitleOne: UILabel!
    @IBOutlet weak var lbTitleTwo: UILabel!
    @IBOutlet weak var lbTitleThree: UILabel!
    @IBOutlet weak var lbCapture: UILabel!
    
    //MARK: - Variables & Constants
    
    var pageViewController : UIPageViewController!
    public static var imageBack : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground2()
        //setLogoinNavigationBar(context: self)
        pageViewController = self.parent as! PageIdMissionVC
        setupView()
    }
    
    private func setupView() {
        viewImg.dropShadow()
        if ( ViewController.selected_document.elementsEqual(Constantes.CREDENCIAL_INE) ) {
            lbTitleOne.text = getStringForKey(key: Constantes.INE_FRONTAL)
            lbTitleTwo.text = getStringForKey(key: Constantes.INE_POSTERIOR)
            lbTitleThree.text = getStringForKey(key: Constantes.SELFIE)
        } else {
            lbTitleOne.text = getStringForKey(key: Constantes.PASAPORTE_TITLE)
            lbTitleTwo.text = Constantes.EMPTY_STRING
            lbTitleThree.text = getStringForKey(key: Constantes.SELFIE)
        }
    }
    
    private func showAlertNotPermission () {
        let alert = UIAlertController(title: getStringForKey(key: Constantes.PERMISSION_DENIED), message: getStringForKey(key: Constantes.MESSAGE_PERMISSION_CAMERA), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: getStringForKey(key: Constantes.GO_TO_SETTINGS), style: .default, handler: { action in
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsUrl)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func actionCapture(_ sender: UIButton) {
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            showAlertNotPermission()
        } else {
            var idBackUIDictionary = [:] as NSMutableDictionary
            let labelNameDictionary = ["page_title_image_capture": "Capture reverso"] as NSMutableDictionary
            let labelDictionary = ["labels": labelNameDictionary] as NSMutableDictionary
            idBackUIDictionary = ["id_capture_back": labelDictionary] as NSMutableDictionary
            let uiConfigDictionary = ["id_type": "VID",
                                      "id_show_instruction":"Y",
                                      "country_code": ViewController.selected_country] as NSMutableDictionary
            
            self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
            
            (UIApplication.shared.delegate as! AppDelegate).supportedOrientation = .all
            //AppItSDK.customizeUserInterface(idBackUIDictionary)
            //AppItSDK.captureBackImage(self, additionalDictionary: ["":""] as NSMutableDictionary, uiConfigDictionary: uiConfigDictionary)
            
        }
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.pageViewController.goToPreviousPage()
    }
    
    @IBAction func actionNExt(_ sender: UIButton) {
        self.pageViewController.goToNextPage()
    }
    
}
/*extension BackVC : AppItSDKResponse {
    
    func captureImageResponse(_ result: NSMutableDictionary) {
        print("CaptureImageResponse")
        self.view.hideDotLoadingIndicator()
        (UIApplication.shared.delegate as! AppDelegate).supportedOrientation = .portrait
        
        if result["StatusCode"] as? String == "2" {
            
        } else if result["StatusCode"] as? String == "1" {
            
            showAlert_view(title: "Alert!!", message: "Please Initialize SDK")
            
        } else if let idFront = result["BACK"] as? String , result["StatusCode"] as? String == "0"{
            let data = Data(base64Encoded: idFront)
            lbCapture.isHidden = true
            imgBack.contentMode = UIView.ContentMode.scaleAspectFit
            imgBack.image =  UIImage(data: data!) ?? UIImage(named: "User.png")!
            BackVC.imageBack = imgBack.image
            
        }
        
    }
    
}*/
