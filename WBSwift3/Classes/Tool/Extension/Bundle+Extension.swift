//
//  Bundle+Extension.swift
//  swift3WB
//
//  Created by 陈秋松 on 2016/10/31.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import Foundation

extension Bundle{
    
    /// 命名空间
    var namespace: String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
