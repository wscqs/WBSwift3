//
//  WeiBoCommon.swift
//  传智微博
//
//  Created by apple on 16/7/2.
//  Copyright © 2016年 itcast. All rights reserved.
//

import Foundation

// MARK: - 应用程序信息
/// 应用程序 ID
let WBAppKey = "2485666231"
/// 应用程序加密信息(开发者可以申请修改)
let WBAppSecret = "a167bcf526afaa5c3563d236ce081d79"
/// 回调地址 - 登录完成调转的 URL，参数以 get 形式拼接
let WBRedirectURI = "https://www.baidu.com"

// MARK: - 全局通知定义
/// 用户需要登录通知
let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"
/// 用户登录成功通知
let WBUserLoginSuccessedNotification = "WBUserLoginSuccessedNotification"
