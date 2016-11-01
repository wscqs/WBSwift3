//
//  QSBaseViewController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

class QSBaseViewController: UIViewController {
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override var title: String?{
        didSet{
            navItem.title = title
        }
    }

}

extension QSBaseViewController{
    
     func setupUI() {
        view.backgroundColor = UIColor.white
        
        // 取消自动缩进 - 如果隐藏了导航栏，会缩进 20 个点
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
    }
}
