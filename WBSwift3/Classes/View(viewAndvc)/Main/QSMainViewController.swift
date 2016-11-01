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
        
        setupChildViewController()
        setupComposeButton()
    }
    
    // MARK: - 监听方法
    // FIXME: 没有实现
    @objc fileprivate func composeStatus()  {
        print("写微博")
    }

    // MARK: - 私有属性
    fileprivate lazy var composeButton: UIButton = UIButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")


}

extension QSMainViewController{
    
    
    /// 设置撰写按钮
    fileprivate func setupComposeButton() {
        tabBar.addSubview(composeButton)
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count
//        composeButton.frame = tabBar.bounds.offsetBy(dx: 2 * w, dy: 0)
        composeButton.frame = CGRect(x: 2 * w, y: 0, width: w, height: tabBar.height)
        
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    /// 设置所有的子控制器
    fileprivate func setupChildViewController() {
        let dicts = [
            ["className":"QSHomeViewController","title":"首页","imageName":"home"],
            ["className":"QSHomeViewController","title":"首页","imageName":""],
            ["className":"","title":"","imageName":""],
            ["className":"QSHomeViewController","title":"首页","imageName":""],
            ["className":"QSHomeViewController","title":"首页","imageName":""]
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
        let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + className) as? UIViewController.Type
             else {
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        let nav = QSNavigationController(rootViewController: vc)
        
        return nav
    }
}
