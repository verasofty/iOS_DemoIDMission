//
//  NewIDMissionVC.swift
//  DemoIDMission
//
//  Created by Juda Escalera on 06/11/24.
//

import UIKit
import IDentityLiteSDK
import SelfieCaptureLite

class NewIDMissionVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var viewSelfie: UIView!
    @IBOutlet weak var viewSelfie2: UIView!
    @IBOutlet weak var viewDocument: UIView!
    @IBOutlet weak var viewDocument2: UIView!
    
    @IBOutlet weak var imgSelfie: UIImageView!
    @IBOutlet weak var imgSelfie2: UIImageView!
    @IBOutlet weak var imgFront: UIImageView!
    @IBOutlet weak var imgBack: UIImageView!
    
    //MARK: - Variables & Constants
    
    let productName = "Identity_Validation_and_Face_Matching"
    let url = "https://kyc.idmission.com/IDS/service/integ/idm/thirdparty/upsert"
    var loginId = "ev_integ_57677"
    var data = "Uwwaqgjf$7"
    var merchantID = "38037"
    let productID = "920"
    var resultado : CustomerEnrollResult!
    var respuesta : IdDataResponse!
    var respuesta2 : PersonalCustomerEnrollResponseData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Methods
    
    private func setupView() {
        
        setupViews()
        initSDK()
        
    }
    
    private func setupViews() {
        viewSelfie.dropShadow()
        viewSelfie.cornerRadiusView = 5
        
        viewSelfie2.dropShadow()
        viewSelfie2.cornerRadiusView = 5
        
        viewDocument.dropShadow()
        viewDocument.cornerRadiusView = 5
        
        viewDocument2.dropShadow()
        viewDocument2.cornerRadiusView = 5
    }
    
    private func initSDK() {
        
        self.view.showDotLoadingIndicator(messsage: "Espere un momento...")
        
        IDentitySDK.initializeApiBaseUrl = "https://kyc.idmission.com/"
        IDentitySDK.apiBaseUrl = "https://api.idmission.com/"
        
        IDentitySDK.initializeSDK(loginId: loginId, password: data, merchantId: merchantID) { error in
            
            if let error = error {
                print("Error al inicializar IDMIssion -> \(error.localizedDescription)")
            } else {
                print("=== Inicialización correcta ===")
            }
            self.view.hideDotLoadingIndicator()
        }
        
    }
    
    private func configPrompts() {
        
        //Strings selfie
        
        SelfieCapture.strings.instructionScreenText = "Por favor retírese lentes y/o sombrero. Evite tener luces brillantes detrás de usted."
        SelfieCapture.strings.instructionScreenButtonText = "Continuar"
        
        SelfieCapture.strings.captureSelfie = "Capturando selfie"
        SelfieCapture.strings.multipleFacesDetected = "Se encuentra más de un rostro en la captura"
        SelfieCapture.strings.moveCloser = "Acérquese un poco más"
        SelfieCapture.strings.moveAway = "Aléjese un poco de la cámara"
        SelfieCapture.strings.alignOval = "Ponga su rostro dentro del óvalo"
        SelfieCapture.strings.notInFocus = "Rostro no enfocado"
        SelfieCapture.strings.capturingFace = "Mántengase quieto por favor, se está capturando su rostro"
        SelfieCapture.strings.realFace = "Rostro detectado"
        SelfieCapture.strings.leftEyeClosed = "Mantenga los ojos abiertos"
        SelfieCapture.strings.rightEyeClosed = "Mantenga los ojos abiertos"
        SelfieCapture.strings.faceMaskDetected = "No use máscara/cubreboca ni nada que obstruya su rostro"
        SelfieCapture.strings.tooMuchLight = "Se detecta mucha luz"
        SelfieCapture.strings.straightenHead = "Enderezar el rostro"
        SelfieCapture.strings.moveFaceDown = "Incline su rostro hacia abajo"
        SelfieCapture.strings.moveFaceUp = "Incline su rostro hacia arriba"
        SelfieCapture.strings.sunglassesDetected = "No use lentes"
        SelfieCapture.strings.removeHat = "No use sombrero"
        SelfieCapture.strings.fakeFace = "Rostro vivo no detectado"
        
        SelfieCapture.strings.retryScreenText = "Rostro vivo no detectado, por favor reintente"
        SelfieCapture.strings.retryButtonText = "Reintentar"
        SelfieCapture.strings.cancelButtonText = "Cancelar"
        
        //Strings captura de documento
        IDCapture.strings.instructionScreenText = "Prepare su INE para la toma de la fotografías"
        IDCapture.strings.instructionScreenButtonText = "Continuar"
        
        IDCapture.strings.moveCloser = "Acerca el documento por favor"
        IDCapture.strings.moveAway = "Aleja el documento por favor"
        IDCapture.strings.alignRectangle = "Alínea el documento dentro del rectángulo"
        IDCapture.strings.notInFocus = "Documento no enfocado"
        IDCapture.strings.useFront = "Fotografíe la parte frontal del documento"
        IDCapture.strings.flipToBack = "Gire su documento a la parte posterior"
        IDCapture.strings.frontBackMismatch = "Documento frontal y posterior no coinciden"
        IDCapture.strings.makeSureBarcodeVisible = "Asegúrese que la parte posterior del documento esté completamente visible"
        IDCapture.strings.makeSurePhotoTextVisible = "Asegúrese que la parte frontal del documento esté completamente visible (fotografía y textos)"
        IDCapture.strings.tooMuchGlare = "Hay demasiado brillo, por favor ajuste el documento a la luz natural"
        IDCapture.strings.documentDetectedHoldStill = "Documento enfocado, por favor no mover"
        IDCapture.strings.captureFront = "Capturando parte frontal del documento"
        IDCapture.strings.captureBack = "Capturando parte trasera del documento"
        
        IDCapture.strings.retryScreenText = "Doucumento físico no detectado, por favor reintente"
        IDCapture.strings.retryButtonText = "Reintentar"
        IDCapture.strings.cancelButtonText = "Cancelar"
        
        //Imagenes
        //IDCapture.images.instructionScreenImage = UIImage(systemName: "person.crop.square.badge.camera.fill") // Si la cambia
        
    }
    
    private func sendImagesToService() {
        print("== FrontVC.sendImagesToService() ==")
        
        let options = AdditionalCustomerWFlagCommonDataV3()
        
        configPrompts()
        
        let personalData = PersonalCustomerCommonRequestEnrollDataV3(uniqueNumber: "89823923")
        
        IDentitySDK.idValidationAndCustomerEnroll(from: self, personalData: personalData, options: options, captureBack: .yes) { result in
            self.view.hideDotLoadingIndicator()
            switch result {
                
            case .success(let customerEnrollResult):
                
                self.resultado = customerEnrollResult
                let selfie = customerEnrollResult.selfie.faceImage
                let selfie2 = customerEnrollResult.selfie.image
                
                self.view.showDotLoadingIndicator(messsage: "Extrayendo datos...")
                self.resultado.submit { result in
                    self.view.hideDotLoadingIndicator()
                    switch result {
                        
                    case .success(let response):
                        
                        print("== Obtención de datos ==")
                        
                        //Selfie
                        self.imgSelfie.image = selfie
                        self.imgSelfie2.image = selfie2
                        self.imgSelfie.contentMode = UIView.ContentMode.scaleAspectFit
                        self.imgSelfie2.contentMode = UIView.ContentMode.scaleAspectFit
                        
                        //Imagen frontal del documento
                        let documentoFrontal = response.responseCustomerData?.extractedIdData!.idProcessImageFront
                        let data = Data(base64Encoded: documentoFrontal!)
                        self.imgFront.image = UIImage(data: data!)
                        self.imgFront.contentMode = UIView.ContentMode.scaleAspectFit
                        
                        //Imagen trasera del documento
                        let documentoTrasero = response.responseCustomerData?.extractedIdData!.idProcessImageBack
                        let data2 = Data(base64Encoded: documentoTrasero!)
                        self.imgBack.image = UIImage(data: data2!)
                        self.imgBack.contentMode = UIView.ContentMode.scaleAspectFit
                        
                        //Set datos
                        //let name = response.responseCustomerData?.extractedPersonalData?.firstName
                        
                        self.respuesta = response.responseCustomerData!.extractedIdData!
                        self.respuesta2 = response.responseCustomerData!.extractedPersonalData!
                        
                        
                    case .failure(let error):
                        print("Error -> \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                print("Error -> \(error.localizedDescription)")
            }
        }
        
    }
    
    private func showAlertNotPermission () {
        let alert = UIAlertController(title: getStringForKey(key: Constantes.PERMISSION_DENIED), message: getStringForKey(key: Constantes.MESSAGE_PERMISSION_CAMERA), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            switch action.style {
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            @unknown default:
                print("default")
            }
        }))
        
        alert.addAction(UIAlertAction(title: getStringForKey(key: Constantes.GO_TO_SETTINGS), style: .default, handler: { action in
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsUrl)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDataVC" {
            if let destino = segue.destination as? ShowDataVC {
                destino.extractedData = respuesta
                destino.extractedData2 = respuesta2
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func actionTakePhotos(_ sender: UIButton) {
        print("== actionTakePhotos ==")
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            showAlertNotPermission()
        } else {
            
            let uiConfigDictionary = ["id_type": ViewController.selected_document,
                                      "id_show_instruction":"Y",
                                      "country_code": ViewController.selected_country] as NSMutableDictionary
            
            self.view.showDotLoadingIndicator(messsage: getStringForKey(key: Constantes.ESPERE))
            
            (UIApplication.shared.delegate as! AppDelegate).supportedOrientation = .all
            sendImagesToService()
        }
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showDataVC", sender: nil)
    }
    
}
