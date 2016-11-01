//
//  QSMainViewController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

class QSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension QSMainViewController{
    
    
    /// 设置所有的子控制器
    private func setupChildViewController() {
        let dicts = [
            ["className":"QSHomeViewController","title":"首页","image":""],
            ["className":"QSHomeViewController","title":"首页","image":""]
        ]
        
        var arrayM = [UIViewController]()
        for dict in dicts{
            arrayM.append(controller(With: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    
    /// 使用字典创建控制器
    ///
    /// - parameter dict: [className,title,image]
    ///
    /// - returns: 子控制器
    private func controller(With dict: [String: String]) -> UIViewController {
        
        guard let className = dict["className"],
        let title = dict["title"],
        let image = dict["image"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + className) as? UIViewController.Type
             else {
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
//        vc.tabBarItem.
        let nav = QSNavigationController(rootViewController: vc)
        
        return nav
    }
}
