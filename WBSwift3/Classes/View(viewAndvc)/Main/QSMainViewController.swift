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
        
        setupChildViewController()
        setupComposeButton()
        
    }
 
    
    /// 用代码控制方向: 好处-横屏的时候可以单独处理
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
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

        var data = NSData(contentsOfFile: "main.json".docDir())
        if data == nil {
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]]
             else {
            return
        }
           
        var arrayM = [UIViewController]()
        for dict in array!{
            arrayM.append(controller(With: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    /// 使用字典创建控制器
    ///
    /// - parameter dict: [className,title,image]
    ///
    /// - returns: 子控制器
    private func controller(With dict: [String: Any]) -> UIViewController {
        
        guard let className = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        let imageName = dict["imageName"] as? String,
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
