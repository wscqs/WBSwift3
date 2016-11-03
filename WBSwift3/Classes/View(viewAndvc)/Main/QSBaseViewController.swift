//
//  QSBaseViewController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

class QSBaseViewController: UIViewController {
    
    /// 表格视图: 如果用户未登录,就不创建
    var tableView: UITableView?
    var refreshController: UIRefreshControl?
    
    /// 上拉刷新标记
    var isPullup: Bool = false
    
    /// 导航栏
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    /// 加载数据
    func loadData(){
        // 如果子类未实现,关闭刷新控件
        refreshController?.endRefreshing()
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
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height,
                                               left: 0,
                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)
        
        refreshController = UIRefreshControl()
        tableView?.addSubview(refreshController!)
        refreshController?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    /// 设置导航栏
    private func setupNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        
        // 解决系统右边白色闪烁的bug
        navigationBar.barTintColor = UIColor.colorWithHexString("F6F6F6")
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}

extension QSBaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        /// 在最后一行做上拉刷新 (最大section,最后一行row)
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        print(row,count)
        if row == (count - 1) && !isPullup {
            print("上拉刷新")
            
            isPullup = true
            
            loadData()
        }
        
    }
}
