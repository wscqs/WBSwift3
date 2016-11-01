//
//  QSHomeViewController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

class QSHomeViewController: QSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showFrends(){
        let demoVC = QSMessageViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
}

extension QSHomeViewController{
    override func setupUI() {
        super.setupUI()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFrends))
//        UIBarButtonItem(title: "好友", target: self, action: #selector(showFrends), isBack: true)
        }
}
