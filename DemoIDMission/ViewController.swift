//
//  ViewController.swift
//  DemoIDMission
//
//  Created by Juda Escalera on 05/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    public static var selected_document = "VID"
    public static var selected_country = "MEX"
    
    //MARK: - IBOutlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    
    @IBAction func initIDMission(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "toIdMissionVC", sender: nil)
        self.performSegue(withIdentifier: "toNewIDMission", sender: nil)
    }
    
}
