////
////  UIImageView+Extension.swift
////  ban
////
////  Created by mba on 16/6/7.
////  Copyright © 2016年 cqs. All rights reserved.
////
//
//import UIKit
//import Haneke
//
//extension UIImageView {
//    
//    /**
//     设置图片
//     
//     - parameter urlString:   URLString
//     - parameter placeholder: 默认图片
//     */
//    func qs_setImageFromUrl(_ urlString: String, placeholder: UIImage) {
//        let url = URL(string: urlString)
//        hnk_setImageFromURL(url!, placeholder: placeholder, format: nil, failure: nil, success: nil)
//    }
//    
//    /**
//     设置图片
//     
//     - parameter urlString:   URLString
//     */
//    func qs_setImageFromUrl(_ urlString: String) {
//        let url = URL(string: urlString)
//        hnk_setImageFromURL(url!, placeholder: UIImage(named: "placeholder"), format: nil, failure: nil, success: nil)
//    }
//    
//    
//    
//    func setRoundView() {
//        self.layer.cornerRadius = self.width * 0.5
//        layer.masksToBounds = true
//    }
//}
