//
//  FrontVC.swift
//  SpendPay
//
//  Created by Juda Escalera on 19/02/21.
//  Copyright © 2021 Juda Escalera. All rights reserved.
//

import UIKit
import AppItFramework_IdFace

class FrontVC: BaseIdMissionVC {
    
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var imgFront: UIImageView!
    @IBOutlet weak var viewImg: UIView!
    @IBOutlet weak var lbTitleOne: UILabel!
    @IBOutlet weak var lbTitleTwo: UILabel!
    @IBOutlet weak var lbTitleThree: UILabel!
    @IBOutlet weak var lsMiddle: NSLayoutConstraint!
    @IBOutlet weak var lsTitle: NSLayoutConstraint!
    @IBOutlet weak var lbCapture: UILabel!
    
    var pageViewController: UIPageViewController!
    public static var imageFront : UIImage!
    
    let productName = "Identity_Validation_and_Face_Matching"
    let url = "https://kyc.idmission.com/IDS/service/integ/idm/thirdparty/upsert"
    var loginId = "ev_integ_57677"
    var data = "Uwwaqgjf$7"
    var merchantID = "38037"
    let productID = "920"
    
    
    /*let loginId = "ev_integ_57661"
     let password = "IDmi#661$"
     let merchantID = "38021"
     let productID = "920"*/
    
    /**
     ==PRODUCCION==
     let url = "https://kyc.idmission.com/IDS/service/integ/idm/thirdparty/upsert";
     let loginId = "ev_integ_57677"
     let password = "Uwwaqgjf$7"
     let merchantID = "38037"
     let productID = "920"
     
     ==DESARROLLO==
     let url = "https://kyc.idmission.com/IDS/service/integ/idm/thirdparty/upsert"
     LOGIN_ID = "ev_integ_56277";
     PASSWORD = "IDmi#277$";
     MERCHANT_ID = "35708";
     PRODUCT_ID = "920";
     
     */
    
    //var language = getStringForKey(key: Constantes.LANGUAJE_IDMISSION)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground2()
        //setLogoinNavigationBar(context: self)
        pageViewController = self.parent as! PageIdMissionVC
        getCredentialesIDMission()
        setupView()
        initSDK()
    }
    
    private func getCredentialesIDMission () {
        
        if ( LogicUtils.isSandbox() ) {
            print("== CREDENCIALES EN DESARROLLO ==")
            loginId = "ev_integ_56277"
            data = "IDmi#277$"
            merchantID = "35708"
            
        } else {
            print("== CREDENCIALES EN PRODUCCION ==")
            loginId = "ev_integ_57677"
            data = "Uwwaqgjf$7"
            merchantID = "38037"
            
        }
        
    }
    
    private func setupView() {
        
        print("== setupView() ==")
        viewImg.dropShadow()
        
        if ( TypeDocumentVC.selected_document.elementsEqual(Constantes.CREDENCIAL_INE) ) {
            lbTitleOne.text = getStringForKey(key: Constantes.INE_FRONTAL)
            lbTitleTwo.text = getStringForKey(key: Constantes.INE_POSTERIOR)
            lbTitleThree.text = getStringForKey(key: Constantes.SELFIE)
        } else {
            lsMiddle = lsMiddle.setMultiplier(multiplier: 0.001)
            lsTitle = lsTitle.setMultiplier(multiplier: 0.499)
            lbTitleOne.text = getStringForKey(key: Constantes.PASAPORTE_TITLE)
            lbTitleTwo.text = Constantes.EMPTY_STRING
            lbTitleThree.text = getStringForKey(key: Constantes.SELFIE)
        }
        
    }
    
    private func initSDK() {
        
        self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
        AppItSDK.initializeAppItSDK(self, url: url, loginId: loginId, password: data, merchantID: merchantID, productID: productID, productName: productName, language: getStringForKey(key: Constantes.LANGUAJE_IDMISSION), enableDebug: false, enableGPS: false)
        
        let labels : NSMutableDictionary = [
            "id_capture_instruction" : getStringForKey(key: Constantes.MENSAJE_PREVIO_DOCUMENTO),
            "light": getStringForKey(key: Constantes.LIGHT),
            "focus": getStringForKey(key: Constantes.FOCUS),
            "align_document_img_capture": getStringForKey(key: Constantes.ALIGN_DOCUMENT_IMG_CAPTURE),
            "subject_is_too_dark_img_capture": getStringForKey(key: Constantes.SUBJECT_IS_TOO_DARK),
            "out_of_focus_img_capture": getStringForKey(key: Constantes.OUT_OF_FOCUS),
            "too_much_glare_img_capture": getStringForKey(key: Constantes.TOO_MUCH_GLARE),
            "page_title_image_capture": getStringForKey(key: Constantes.PAGE_TITLE_IMAGE_CAPTURE),
            "capturing_id_scanbarcode":getStringForKey(key: Constantes.CAPTURING_ID_SAMBARCODE),
            "capturing_id_scanbarcode_msg":getStringForKey(key: Constantes.CAPTURING_ID_SCANBARCODE_MSG),
            "glare":getStringForKey(key: Constantes.GLARE),
            "align_id_and_mrz_inside_rectangle":getStringForKey(key: Constantes.ALIGN_ID_AND_MRZ_INSIDE_RCTANGLE),
            "align_barcode_inside_rectangle": getStringForKey(key: Constantes.ALIGN_BARCODE_INSIDE_RECTANGLE),
            "mrz_not_detected": getStringForKey(key: Constantes.MRZ_NOT_DETECTED),
            "mrz_detected_not_valid": getStringForKey(key: Constantes.MRZ_DETECTED_NOT_VALID),
            "barcode_mrz_not_found": getStringForKey(key: Constantes.BARCODE_MRZ_NOT_FOUND),
            "barcode_detected_error_message":getStringForKey(key: Constantes.BARCODE_DETECTED_ERROR_MESSAGE),
            "capturing_id_scanbarcode_pdf_417_msg":getStringForKey(key: Constantes.CAPTURING_ID_SCANBARCODE_PDF),
            "capturing_id_scanbarcode_pdf417_msg":getStringForKey(key: Constantes.CAPTURING_ID_BARCODE_PDF417),
            "move_id_closer":getStringForKey(key: Constantes.MOVE_ID_CLOSER),
            "move_id_away":getStringForKey(key: Constantes.MOVE_ID_WAY),
            "align_document_inside_rectangle":getStringForKey(key: Constantes.ALIGN_DOCUMENT_INSIDE_RECTANGLE),
            "id_capture_preview_header":getStringForKey(key: Constantes.ID_CAPTURE_PREVIEW_HEADER),
            "id_capture_preview_message":getStringForKey(key: Constantes.ID_CAPTURE_PREVIEW_MESSAGE),
            "barcode_error_message":getStringForKey(key: Constantes.BARCODE_ERROR_MESSAGE),
            "mrz_error_message":getStringForKey(key: Constantes.MRZ_ERROR_MESSAGE),
            "barcode_mrz_error_message":getStringForKey(key: Constantes.BARCODE_MRZ_ERROR_MESSAGE),
            "id_capture_success_message": getStringForKey(key: Constantes.ID_CAPTURE_SUCCESS_MESSAGE),
            "id_capture_instruction_continue": getStringForKey(key: Constantes.ID_CAPTURE_INSTRUCTION_CONTINUE)
        ]
        let captureFront : NSMutableDictionary = [
            "labels" : labels
        ]
        let dictParams:NSMutableDictionary? = [
            "id_capture_front" : captureFront,
            "id_capture_back" : captureFront
        ]
        
        //AppItSDK.customizeUserInterface(dictParams!)
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
        print("== FrontVC.actionCapture() ==")
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            showAlertNotPermission()
        } else {
            print("selected_document -> \(TypeDocumentVC.selected_document)")
            print("selected_country -> \(TypeDocumentVC.selected_country)")
            
            let uiConfigDictionary = ["id_type": TypeDocumentVC.selected_document,
                                      "id_show_instruction":"Y",
                                      "country_code": TypeDocumentVC.selected_country] as NSMutableDictionary
            
            self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
            
            (UIApplication.shared.delegate as! AppDelegate).supportedOrientation = .all
            
            AppItSDK.captureFrontImage(self, additionalDictionary: [:], uiConfigDictionary: uiConfigDictionary)
        }
        
    }
    
    @IBAction func actionExit(_ sender: UIButton) {
        print("== exit() ==")
        
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        print("== next() ==")
        
        self.pageViewController.goToNextPage()
        
    }
    
}
extension FrontVC : AppItSDKResponse {
    
    //Initialize SDK Response
    func initializeSDKResponse(_ result: NSMutableDictionary!) {
        
        print("initializeSDKResponse", result ?? "default value" )
        self.view.hideDotLoadingIndicator()
        
        guard let responseDict = result else {
            return
        }
        
        if let statusMessage = responseDict["statusMessage"] as? String, statusMessage == "invalid_request_param",
           let statusCode = responseDict["statusCode"] as? String, statusCode == "7" {
            
            guard let result = responseDict["Result"] as? [String:String] else { return}
            let Status_Message = result["Status_Message"]
            
            if Status_Message != "", Status_Message != nil  {
                self.showAlert_view(title: "Alert!!", message: "Error:".appending(Status_Message!))
            } else {
                self.showAlert_view(title: "Alert!!", message: "Initialization failed.\nPlease try again.")
            }
        } else if let statusMessage = responseDict["statusMessage"] as? String, statusMessage  != "success_msg", statusMessage  != "Success",
                  let statusCode = responseDict["statusCode"] as? String, statusCode != "0" {
            self.showAlert_view(title: "Alert!!", message: "Initialization failed.\nPlease try again.")
        } else {
            // Initialization SuccessFull
            //self.performSegue(withIdentifier: "toIdMission", sender: nil)
        }
    }
    
    //Id Capture Response
    func captureImageResponse(_ result: NSMutableDictionary) {
        print("CaptureImageResponse")
        self.view.hideDotLoadingIndicator()
        (UIApplication.shared.delegate as! AppDelegate).supportedOrientation = .portrait
        
        if result["StatusCode"] as? String == "2" {
            
        } else if result["StatusCode"] as? String == "1" {
            
            showAlert_view(title: "Alert!!", message: "Please Initialize SDK")
            
        } else if let idFront = result["FRONT"] as? String , result["StatusCode"] as? String == "0"{
            let data = Data(base64Encoded: idFront)
            lbCapture.isHidden = true
            imgFront.contentMode = UIView.ContentMode.scaleAspectFit
            imgFront.image =  UIImage(data: data!) ?? UIImage(named: "User.png")!
            FrontVC.imageFront = imgFront.image
        }
    }
}

