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
        // 主->子控制器  隐藏tabbar
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        if let vc = viewController as? QSBaseViewController {
            var backTitle = "返回"
            if viewControllers.count == 1 {
                backTitle = childViewControllers.first?.title ?? "返回"
            }
            
            vc.navItem.leftBarButtonItem = UIBarButtonItem(title: backTitle, target: self, action: #selector(popToParent), isBack: true)
        }
        
        
        
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func popToParent() {
        popViewController(animated: true)
    }

}
