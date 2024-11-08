//
//  SelfieVC.swift
//  SpendPay
//
//  Created by Juda Escalera on 19/02/21.
//  Copyright © 2021 Juda Escalera. All rights reserved.
//

import UIKit
import IDentityLiteSDK
import SelfieCaptureLite
//import AppItFramework_IdFace

class SelfieVC: BaseIdMissionVC {
    
    //MARK: - Variables & Constantes
    
    var nationality = "MEX"
    var name : String = Constantes.EMPTY_STRING
    var last_name : String = Constantes.EMPTY_STRING
    var last_name_2 = Constantes.EMPTY_STRING
    var gender : String = Constantes.EMPTY_STRING
    var curp : String = Constantes.EMPTY_STRING
    var validity : String = Constantes.EMPTY_STRING
    var ine_number : String = Constantes.EMPTY_STRING
    var date_of_birth : String = Constantes.EMPTY_STRING
    var form_key : String = Constantes.EMPTY_STRING
    var form_id : String = Constantes.EMPTY_STRING
    var onboarding_id : String = Constantes.EMPTY_STRING
    var appVersion = Constantes.EMPTY_STRING
    let mrzAndIdData = "mrz and id data mismatch"
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imgSelfie: UIImageView!
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var viewImg: UIView!
    @IBOutlet weak var lbTitleOne: UILabel!
    @IBOutlet weak var lbTitleTwo: UILabel!
    @IBOutlet weak var lbTitleThree: UILabel!
    @IBOutlet weak var lsMiddle: NSLayoutConstraint!
    @IBOutlet weak var lsSelfie: NSLayoutConstraint!
    @IBOutlet weak var lbCapture: UILabel!
    
    //MARK: - Referencias e Inicializaciones
    
    let defaults = UserDefaults.standard
    var pageViewController : UIPageViewController!
    public static var selfieImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground2()
        setVersion()
        //setLogoinNavigationBar(context: self)
        pageViewController = self.parent as! PageIdMissionVC
        setupView()
    }
    
    private func setupView() {
        viewImg.dropShadow()
        if ( "VID".elementsEqual(Constantes.CREDENCIAL_INE) ) {
            lbTitleOne.text = getStringForKey(key: Constantes.INE_FRONTAL)
            lbTitleTwo.text = getStringForKey(key: Constantes.INE_POSTERIOR)
            lbTitleThree.text = getStringForKey(key: Constantes.SELFIE)
        } else {
            lsMiddle = lsMiddle.setMultiplier(multiplier: 0.001)
            lsSelfie = lsSelfie.setMultiplier(multiplier: 0.499)
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
    
    private func takeSelfie() {
        
        IDentitySDK.liveFaceCheck(from: self) { result in
            self.view.hideDotLoadingIndicator()
            switch result {
                
            case .success(let response):
                self.lbCapture.isHidden = true
                self.imgSelfie.image = response.selfie.image
                self.imgSelfie.contentMode = UIView.ContentMode.scaleAspectFit
            case .failure(let error):
                print("Error -> \(error.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func actionCapture(_ sender: UIButton) {
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            showAlertNotPermission()
        } else {
            self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
            
            let FaceDetect_Dictionary = [
                "fd_enable_passive_face_detection":"Y"] as NSMutableDictionary
            
            takeSelfie()
            //AppItSDK.detectFace(self, faceCaptureConfig: FaceDetect_Dictionary)
            
        }
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.pageViewController.goToPreviousPage()
    }
    
    func getCurrentTimeInMilliseconds() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm:ss:SSS"
        let convertedDate: String = dateFormatter.string(from: currentDate) //07:07:07:777
        return convertedDate
    }
    
    @IBAction func actionFinalize(_ sender: UIButton) {
        
        if ( validateElements() ) {
            finalizeProcess()
        }
        //Descomentar para pasar a la siguiente pantalla sin tomar fotografías
        //finalizeProcess()
    }
    
    private func setVersion() {
        appVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
        //lbVersion.text = "\(getStringForKey(key: Constantes.VERSION_APP)): \(appVersion ?? "1.0")"
    }
    
    private func validateElements() -> Bool {
        
        var flag = true
        if ( "VID".elementsEqual(Constantes.PASAPORTE) ) {
            if ( SelfieVC.selfieImage == nil || FrontVC.imageFront == nil) {
                flag = false
                showErrorAlert(error: getStringForKey(key: Constantes.VERIFICAR_IMAGENES))
            }
        } else {
            if ( SelfieVC.selfieImage == nil || BackVC.imageBack == nil || FrontVC.imageFront == nil) {
                flag = false
                showErrorAlert(error: getStringForKey(key: Constantes.VERIFICAR_IMAGENES))
            }
        }
        
        return flag
        
    }
    
    func imageIsNullOrNot(imageName : UIImage)-> Bool
    {
        
        let size = CGSize(width: 0, height: 0)
        if (imageName.size.width == size.width)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    private func finalizeProcess() {
        
        var email = Constantes.EMPTY_STRING
        let POSITIVE = "Y"
        let CUSTOMER_NAME = "Customer_Name"
        let UNIQUE_CUSTOMER_NUMBER = "Unique_Customer_Number"
        let POST_DATA_API_REQUIRED = "POST_Data_API_Required"
        let SEND_INPUT_IMAGES_IN_POST = "Send_Input_Images_in_POST"
        let SEND_PROCESSED_IMAGES_IN_POST = "Send_Processed_Images_in_POST"
        let BYPASS_NAME_MATCHING = "Bypass_Name_Matching"
        let COUNTRY_APP_NAME = "Country"
        
        if ((defaults.string(forKey: Constantes.MAIL_IDMISSION)) != nil) {
            email = defaults.string(forKey: Constantes.MAIL_IDMISSION)!
        }
        
        let serviceID = "50"
        var uniqueCustNumber = "\(email)-\(self.getCurrentTimeInMilliseconds())"
        
        if ( uniqueCustNumber.count > 44 ) {
            let index = uniqueCustNumber.count - 44
            uniqueCustNumber = uniqueCustNumber[index..<uniqueCustNumber.count]
        }
        print("uniqueCustomer -> \(uniqueCustNumber)")
        let idType = "VID"
        let countrytype = "MEX" //CountryCode
        let stateType = ""   //StateCode
        
        let additionalJSONDict = ["Service_ID": serviceID,
                                  CUSTOMER_NAME: email,
                                  POST_DATA_API_REQUIRED: POSITIVE,
                                  SEND_PROCESSED_IMAGES_IN_POST: POSITIVE,
                                  SEND_INPUT_IMAGES_IN_POST: POSITIVE,
                                  BYPASS_NAME_MATCHING: POSITIVE,
                                  COUNTRY_APP_NAME: "Kashpay-\(appVersion)",
                                  UNIQUE_CUSTOMER_NUMBER: uniqueCustNumber] as NSMutableDictionary
        
        let Enroll_ID_Selfie_Dict = ["additionalDictionary": additionalJSONDict,
                                     "clearFormKey": "Y",
                                     "imageType":idType,
                                     "countryCode":countrytype,
                                     "stateCode":stateType,
                                     "faceImageType": "FACE_IMAGE"] as NSMutableDictionary
        
        self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
        
        //AppItSDK.genericApiCall(self, genericDataDictionary: Enroll_ID_Selfie_Dict)
        
        //Para pasar directo a la pantalla, descomentar el siguiente código
        
         /*last_name_2 = "Flores"
         name = "Judá Adriel"
         last_name = "Escalera"
         gender = "H"
         curp = "UAFF990203HCLSLD03"
         validity = "2022"
         ine_number = "12321416"
         date_of_birth = "28/03/1988"
         self.performSegue(withIdentifier: Constantes.TO_DATA_USER, sender: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constantes.TO_DATA_USER {
            
            /*let controller = segue.destination as! PersonalInfoVC
            controller.apellido_materno = last_name_2
            controller.name = name
            controller.apellidos = last_name
            controller.gender = gender
            controller.curp = curp
            controller.vigencia = validity
            controller.numeroDocumento = ine_number
            controller.date_of_birth = date_of_birth*/
        }
    }
    
}
/*extension SelfieVC: AppItSDKResponse {
    
    func faceDetectionResponse(_ result: NSMutableDictionary) {
        print("== faceDetectionResponse() ==")
        self.view.hideDotLoadingIndicator()
        
        if let FACE = result["FACE"] as? String, let statusCode = result["StatusCode"], statusCode as! String  == "0" {
            
            let data = Data(base64Encoded: FACE)
            lbCapture.isHidden = true
            imgSelfie.contentMode = UIView.ContentMode.scaleAspectFit
            imgSelfie.image =  UIImage(data: data!) ?? UIImage(named: "selfycapture.png")!
            SelfieVC.selfieImage = imgSelfie.image
        } else if let statusCode = result["StatusCode"], statusCode as! String  == "12" {
            
        } else if let statusCode = result["StatusCode"], statusCode as! String  == "5" {
            imgSelfie.contentMode = UIView.ContentMode.center
            //imgSelfie.image = UIImage(named: "selfycapture.png")!
        } else {
            
        }
    }
    
    
    func genericApiCall(_ result: NSMutableDictionary) {
        print("== genericApiCall() ==")
        
        self.view.hideDotLoadingIndicator()
        
        var statusLabel = "Unable To Enroll"
        
        var x = 0
        for (key, value) in result {
            print("================(\(x))================")
            x+=1
            print("key: \(key), value: \(value)")
        }
        
        if let dict = result["Result"] {
            let resultDictionary = dict as! NSMutableDictionary
            if let state = resultDictionary["State"] {
                print("state -> \(state)")
                var respuesta = state as! String
                print("respuesta.lowercased() -> \( respuesta.lowercased() )")
                if  respuesta.lowercased() == "submitted" || respuesta.lowercased() == "approved" || respuesta.lowercased() == "customer onboarded" || respuesta.lowercased() == "under the age of 18" || respuesta.lowercased() == mrzAndIdData {
                    statusLabel = "Enrollment Successfull"
                    
                    if (resultDictionary[Constantes.IDM_FIRST_NAME_DOC] != nil) {
                        name = resultDictionary[Constantes.IDM_FIRST_NAME_DOC] as! String
                    }
                    
                    if (resultDictionary[Constantes.IDM_LAST_NAME] != nil) {
                        last_name = resultDictionary[Constantes.IDM_LAST_NAME] as! String
                    }
                    
                    if (resultDictionary[Constantes.IDM_LAST_NAME_TWO] != nil) {
                        last_name_2 = resultDictionary[Constantes.IDM_LAST_NAME_TWO] as! String
                    }
                    
                    if(resultDictionary[Constantes.IDM_GENDER] != nil) {
                        gender = resultDictionary[Constantes.IDM_GENDER] as! String
                    }
                    
                    if (resultDictionary[Constantes.IDM_CURP] != nil) {
                        curp = resultDictionary[Constantes.IDM_CURP] as! String
                    }
                    
                    if (resultDictionary[Constantes.IDM_EMPIRATION_DATE] != nil) {
                        validity = resultDictionary[Constantes.IDM_EMPIRATION_DATE] as! String
                    }
                    
                    if (resultDictionary[Constantes.IDM_INE_NUMBER] != nil) {
                        ine_number = resultDictionary[Constantes.IDM_INE_NUMBER] as! String
                    }
                    
                    if ( ine_number.elementsEqual(Constantes.EMPTY_STRING) ) {
                        if (resultDictionary[Constantes.IDM_IDNUMER_1] != nil) {
                            print("entró aquí -> IDM_IDNUMER_1")
                            ine_number = resultDictionary[Constantes.IDM_IDNUMER_1] as! String
                        }
                    }
                    
                    if ( ine_number.elementsEqual(Constantes.EMPTY_STRING) ) {
                        if (resultDictionary[Constantes.IDM_MRZ_IDNUMER] != nil) {
                            print("entró aquí -> IDM_MRZ_IDNUMER")
                            ine_number = resultDictionary[Constantes.IDM_MRZ_IDNUMER] as! String
                        }
                    }
                    
                    if ( resultDictionary[Constantes.IDM_NATIONALITY] != nil ) {
                        nationality = resultDictionary[Constantes.IDM_NATIONALITY] as! String
                    }
                    
                    if ( nationality.elementsEqual(Constantes.EMPTY_STRING) ) {
                        if ( resultDictionary[Constantes.IDM_MRZ_NATIONALITY] != nil ) {
                            nationality = resultDictionary[Constantes.IDM_MRZ_NATIONALITY] as! String
                        }
                    }
                    
                    if (resultDictionary[Constantes.IDM_DATEBIRTH] != nil) {
                        date_of_birth = resultDictionary[Constantes.IDM_DATEBIRTH] as! String
                    }
                    if (resultDictionary[Constantes.FORM_KEY] != nil) {
                        form_key = resultDictionary[Constantes.FORM_KEY] as! String
                    }
                    if (resultDictionary[Constantes.FORM_ID] != nil) {
                        form_id = resultDictionary[Constantes.FORM_ID] as! String
                    }
                    if (resultDictionary[Constantes.REQUEST_ID] != nil) {
                        onboarding_id = resultDictionary[Constantes.REQUEST_ID] as! String
                    }
                    
                    print("== Datos extraídos por IdMission ==")
                    print("name -> \(name)")
                    print("nationality -> \(nationality)")
                    print("last name -> \(last_name)")
                    print("last name 2 -> \(last_name_2)")
                    print("gender -> \(gender)")
                    print("curp -> \(curp)")
                    print("validity -> \(validity)")
                    print("ine number -> \(ine_number)")
                    print("fecha de nacimiento -> \(date_of_birth)")
                    print("form_id -> \(form_id)")
                    print("form_key -> \(form_key)")
                    print("onboarding ID -> \(onboarding_id)")
                    //|| last_name_2.isEmpty  <- Agregar si se desea validar el apellido materno
                    if ( name.isEmpty || last_name.isEmpty || gender.isEmpty || ine_number.isEmpty || respuesta.lowercased() == mrzAndIdData) {
                        showAlert_view(title: getStringForKey(key: Constantes.IMPORTANTE), message: getStringForKey(key: Constantes.ERROR_DATOS_DOCUMENTO))
                    } else {
                        
                        if ( "VID".elementsEqual(Constantes.CREDENCIAL_INE) && curp.isEmpty ) {
                            showAlert_view(title: getStringForKey(key: Constantes.IMPORTANTE), message: getStringForKey(key: Constantes.ERROR_DATOS_DOCUMENTO))
                        } else {
                            //self.performSegue(withIdentifier: Constantes.TO_DATA_USER, sender: nil)
                        }
                        
                    }
                    
                } else {
                    statusLabel = state as! String
                    showAlert_view(title: getStringForKey(key: Constantes.IMPORTANTE), message: statusLabel)
                    print("============ ERROR en IDMISSION ============")
                    print(statusLabel)
                    
                    //Flujo a ser borrado
                    
                    /*if (resultDictionary[Constantes.IDM_FIRST_NAME_DOC] != nil) {
                     name = resultDictionary[Constantes.IDM_FIRST_NAME_DOC] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_LAST_NAME] != nil) {
                     last_name = resultDictionary[Constantes.IDM_LAST_NAME] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_LAST_NAME_TWO] != nil) {
                     last_name_2 = resultDictionary[Constantes.IDM_LAST_NAME_TWO] as! String
                     }
                     
                     if(resultDictionary[Constantes.IDM_GENDER] != nil) {
                     gender = resultDictionary[Constantes.IDM_GENDER] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_CURP] != nil) {
                     curp = resultDictionary[Constantes.IDM_CURP] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_EMPIRATION_DATE] != nil) {
                     validity = resultDictionary[Constantes.IDM_EMPIRATION_DATE] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_INE_NUMBER] != nil) {
                     ine_number = resultDictionary[Constantes.IDM_INE_NUMBER] as! String
                     }
                     
                     if (resultDictionary[Constantes.IDM_DATEBIRTH] != nil) {
                     date_of_birth = resultDictionary[Constantes.IDM_DATEBIRTH] as! String
                     }
                     if (resultDictionary[Constantes.FORM_KEY] != nil) {
                     form_key = resultDictionary[Constantes.FORM_KEY] as! String
                     }
                     if (resultDictionary[Constantes.FORM_ID] != nil) {
                     form_id = resultDictionary[Constantes.FORM_ID] as! String
                     }
                     if (resultDictionary[Constantes.REQUEST_ID] != nil) {
                     onboarding_id = resultDictionary[Constantes.REQUEST_ID] as! String
                     }
                     RegisterDataClientVC.valuesForRegister.updateValue(onboarding_id, forKey: RequestConstants.ONBOARD_ID)
                     RegisterDataClientVC.valuesForRegister.updateValue(form_id, forKey: RequestConstants.FORM_ID)
                     RegisterDataClientVC.valuesForRegister.updateValue(form_key, forKey: RequestConstants.FORM_KEY)
                     
                     print("== Datos extraídos por IdMission ==")
                     print("name -> \(name)")
                     print("last name -> \(last_name)")
                     print("last name 2 -> \(last_name_2)")
                     print("gender -> \(gender)")
                     print("curp -> \(curp)")
                     print("validity -> \(validity)")
                     print("ine number -> \(ine_number)")
                     print("fecha de nacimiento -> \(date_of_birth)")
                     print("form_id -> \(form_id)")
                     print("form_key -> \(form_key)")
                     print("onboarding ID -> \(onboarding_id)")
                     
                     self.performSegue(withIdentifier: Constantes.TO_DATA_USER, sender: nil)*/
                    
                    //Hasta aquí
                    
                }
            }
        }
        
        //showAlert_view(title: "Importante", message: statusLabel)
        
    }
    
}*/
