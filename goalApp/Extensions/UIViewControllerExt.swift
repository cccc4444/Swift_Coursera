//
//  UIViewControllerExt.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 03.05.2022.
//

import UIKit

extension UIViewController{
    // rewrite default animation
    
    func presentDetail(_ viewControllerToPresent: UIViewController){
        //CA = core animation
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
        // false coz we already overwritten
        // nil coz we dont care when it's finished
    
        
    }
    func dismissDetail(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}
