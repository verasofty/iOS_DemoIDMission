//
//  PageVC.swift
//  SpendPay
//
//  Created by Juda Escalera on 19/02/21.
//  Copyright © 2021 Juda Escalera. All rights reserved.
//

import UIKit

class PageIdMissionVC: UIPageViewController {
    
    let FRONT = "frontVC"
    let BACK = "backVC"
    let SELFIE = "selfieVC"
    
    private var myControllers : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setLogoinNavigationBar(context: self)
        dataSource = self
        setupViewControllers()
        
    }
    
    public func setLogoinNavigationBar(context:UIViewController) {
        print("== setLogoinNavigationBar() ==")
        let imageView = UIImageView(frame: CGRect(x: -20, y: 0, width: 5, height: 5))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: Constantes.LOGO)
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    private func setupViewControllers() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let firstController = storyboard.instantiateViewController(withIdentifier: FRONT)
        let secondController = storyboard.instantiateViewController(withIdentifier: BACK)
        let thirdController = storyboard.instantiateViewController(withIdentifier: SELFIE)
        
        if ( TypeDocumentVC.selected_document.elementsEqual(Constantes.PASAPORTE) ) {
            myControllers.append(firstController)
            myControllers.append(thirdController)
        } else {
            myControllers.append(firstController)
            myControllers.append(secondController)
            myControllers.append(thirdController)
            
        }
        
        
        if let firstViewController = myControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
}

extension PageIdMissionVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = myControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard myControllers.count > previousIndex else {
            return nil
        }
        
        return myControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = myControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = myControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return myControllers[nextIndex]
    }
    
}

extension UIPageViewController {
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
    }

    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentViewController){
                setViewControllers([previousPage], direction: .reverse, animated: true, completion: completion)
            }
        }
    }
}

