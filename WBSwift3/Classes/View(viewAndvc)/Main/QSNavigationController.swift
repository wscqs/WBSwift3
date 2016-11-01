//
//  QSNavigationController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

class QSNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }        
        super.pushViewController(viewController, animated: animated)
    }

}
