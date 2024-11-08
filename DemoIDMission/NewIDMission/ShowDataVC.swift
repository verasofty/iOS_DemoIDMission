//
//  ShowDataVC.swift
//  DemoIDMission
//
//  Created by Juda Escalera on 07/11/24.
//

import UIKit
import IDentityLiteSDK

class ShowDataVC: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var tvData1: UITextView!
    
    //MARK: - Variables & Constants
    
    var extractedData: IdDataResponse!
    var extractedData2: PersonalCustomerEnrollResponseData!
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Methods
    
    private func setupView() {
        
        setDataExtractedData()
        
    }
    
    private func setDataExtractedData() {
        var string = Constantes.EMPTY_STRING
        
        if let _ = extractedData.ageOver18 {
            string = "ageOver18 -> \( extractedData!.ageOver18! )"
        }
        
        if let _ = extractedData.barcodeDataParsed {
            string.append( "\nbarcodeDataParsed -> \( extractedData!.barcodeDataParsed! )" )
        }
        
        if let _ = extractedData.idCountry {
            string.append( "\nidCountry -> \(extractedData!.idCountry!)" )
        }
        
        if let _ = extractedData.idDateOfBirth {
            string.append( "\nidDateOfBirth -> \(extractedData!.idDateOfBirth!)" )
        }
       
        
        if let _ = extractedData.idDateOfBirthFormatted {
            string.append( "\nidDateOfBirthFormatted -> \(extractedData!.idDateOfBirthFormatted!)" )
        }
        
        
        if let _ = extractedData.idExpirationDate {
            string.append( "\nidExpirationDate -> \(extractedData!.idExpirationDate!)" )
        }
        
        if let _ = extractedData.idNumber {
            string.append( "\nidNumber -> \(extractedData!.idNumber!)" )
        }
        
        if let _ = extractedData.idNumber2 {
            string.append( "\nidNumber2 -> \(extractedData!.idNumber2!)" )
        }
        
        if let _ = extractedData.idNumber3 {
            string.append( "\nidNumber3 -> \(extractedData!.idNumber3!)" )
        }
        
        if let _ = extractedData.mrzData {
            string.append( "\nmrzData -> \(extractedData!.mrzData!)" )
        }
        
        string.append("\n\n===============================\n\n")
        
        if let _ = extractedData2.addressLine1 {
            string.append("\naddressLine1 -> \( extractedData2.addressLine1! )")
        }
        
        if let _ = extractedData2.addressLine2 {
            string.append("\naddressLine2 -> \( extractedData2.addressLine2! )")
        }
        
        if let _ = extractedData2.addressLine3 {
            string.append("\naddressLine3 -> \( extractedData2.addressLine3! )")
        }
        
        if let _ = extractedData2.city {
            string.append("\ncity -> \( extractedData2.city! )")
        }
        
        if let _ = extractedData2.country {
            string.append("\ncountry -> \( extractedData2.country! )")
        }
       
        if let _ = extractedData2.dob_doc {
            string.append("\ndob_doc -> \( extractedData2.dob_doc! )")
        }
        
        if let _ = extractedData2.email {
            string.append("\nemail -> \( extractedData2.email! )")
        }
        
        if let _ = extractedData2.firstName_doc {
            string.append("\nfirstName_doc -> \( extractedData2.firstName_doc! )")
        }
        
        if let _ = extractedData2.firstName {
            string.append("\nfirstName -> \( extractedData2.firstName! )")
        }
        
        if let _ = extractedData2.firstNameNonEng {
            string.append("\nfirstNameNonEng -> \( extractedData2.firstNameNonEng! )")
        }
        
        if let _ = extractedData2.lastName_doc {
            string.append("\nlastName_doc -> \( extractedData2.lastName_doc! )")
        }
        
        if let _ = extractedData2.gender {
            string.append("\ngender -> \( extractedData2.gender! )")
        }
        
        if let _ = extractedData2.name_doc {
            string.append("\nname_doc -> \( extractedData2.name_doc! )")
        }
       
        if let _ = extractedData2.postalCode {
            string.append("\npostalCode -> \( extractedData2.postalCode! )")
        }
        
        if let _ = extractedData2.middleName {
            string.append("\nmiddleName -> \( extractedData2.middleName! )")
        }
        
        tvData1.text = string
        
    }

}
