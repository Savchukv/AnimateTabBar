//
//  TabBarVC.swift
//  AnimateTabBar
//
//  Created by Василий Савчук on 13.07.2020.
//  Copyright © 2020 Vaseks. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    private lazy var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.1, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()

    // MARK: - Lifecicle Object
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    // MARK: - UITabBarControllerDelegate

extension TabBarVC: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let imageView = item.value(forKey: "view") as? UIView else { return }
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
}
