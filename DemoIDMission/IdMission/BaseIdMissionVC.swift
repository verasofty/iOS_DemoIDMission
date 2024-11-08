//
//  BaseIdMissionVC.swift
//  SpendPay
//
//  Created by Juda Escalera on 04/03/21.
//  Copyright © 2021 Juda Escalera. All rights reserved.
//

import UIKit

class BaseIdMissionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert_view(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) -> Void in
        }))
        self.present(alert, animated: true)
    }
    
    public func setLogoinNavigationBar(context:UIViewController){
        print("== setLogoinNavigationBar() ==")
        let imageView = UIImageView(frame: CGRect(x: -20, y: 0, width: 5, height: 5))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: Constantes.LOGO)
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    func assignbackground2(){
        let background = UIImage(named:  Constantes.BACK_IMAGE)
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        //view.addSubview(imageView)
        //self.view.sendSubviewToBack(imageView)
        view.backgroundColor = .white
    }
    
    func showErrorAlert(error:String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) -> Void in
        }))
        self.present(alert, animated: true)
    }

}
