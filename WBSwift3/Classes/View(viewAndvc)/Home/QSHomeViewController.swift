//
//  QSHomeViewController.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

fileprivate let cellID = "cellID"
class QSHomeViewController: QSBaseViewController {
    
    /// 微博数据数组
    fileprivate lazy var statusList = [String]()
    
    override func loadData() {
        for i in 0..<15 {
            if isPullup {
                statusList.append("上拉\(i)")
            }else {
                statusList.insert(i.description, at: 0)
            }
        }
        refreshController?.endRefreshing()
        isPullup = false
        tableView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showFrends(){
        let demoVC = QSMessageViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
}

extension QSHomeViewController {
    override func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
    
}

extension QSHomeViewController{
    
    override func setupTableView() {
        super.setupTableView()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFrends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
