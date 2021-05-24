//
//  Extension.swift
//  Attendance_App
//
//  Created by J.K on 5/24/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

extension ClassViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trasition.isPresenting = true
        return trasition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trasition.isPresenting = false
        return trasition
    }
}
