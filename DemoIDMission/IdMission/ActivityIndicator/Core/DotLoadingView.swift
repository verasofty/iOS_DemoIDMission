//
//  DotLoadingView.swift
//  eVolvDemo
//
//  Created by MCB-Air-036 on 21/02/20.
//  Copyright © 2020 Idmission. All rights reserved.
//

import UIKit
import SwiftGifOrigin

public final class DotLoadingView: UIView {

    @IBOutlet weak var dotLoadingIndicator: UIImageView!
    
    @IBOutlet weak var dotLoadingMessageLabel: UILabel!

    public func startAnimating() {
        dotLoadingIndicator.image = UIImage.gif(name: "loader")
        self.isHidden = false
    }

    public func stopAnimating() {
        self.isHidden = true
        dotLoadingIndicator.removeFromSuperview()
    }
}

private var loadingIndicatorAssociationKey = 0x1023

extension DotLoadingView: NibLoadable {}

public extension UIView {
    private var loadingIndicator: DotLoadingView? {
        get {
            return objc_getAssociatedObject(self, &loadingIndicatorAssociationKey) as? DotLoadingView
        }
        set {
            objc_setAssociatedObject(self, &loadingIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func showDotLoadingIndicator(messsage:String?) {
        let dotLoadView = DotLoadingView.createFromNib()
        if let Message = messsage{
            dotLoadView.dotLoadingMessageLabel.text = Message
        } else {
            dotLoadView.dotLoadingMessageLabel.text = "Provide message for loader"
        }
        loadingIndicator = dotLoadView
        safeAddSubView(subView: dotLoadView, viewTag: Int(loadingIndicatorAssociationKey))
        dotLoadView.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: dotLoadView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: dotLoadView.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: dotLoadView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: dotLoadView.rightAnchor).isActive = true
        loadingIndicator?.startAnimating()
    }

    func hideDotLoadingIndicator() {
        loadingIndicator?.stopAnimating()
        loadingIndicator?.removeFromSuperview()
        loadingIndicator = nil
    }
}
