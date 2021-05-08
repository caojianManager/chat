//
//  ChatLoginStatUtilViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/13.
//

import Foundation

enum ChatLoginStatUtilType : Int {
    case  ChatLoginStatUtilTypeEnter = 1
    case  ChatLoginStatUtilTypeLoginSuccess = 2
    case  ChatLoginStatUtilTypeFailure = 3
    case  ChatLoginStatUtilTypeLoginClick = 4
}

enum ChatLoginStatAccountType : Int {
    case ChatLoginStatAccountTypeUnknow = 10
    case ChatLoginStatAccountTypePhone = 20
    case ChatLoginStatAccountTypeQQ = 30
    case ChatLoginStatAccountTypeWeiXin = 40
}

enum ChatLoginStatLoginType : Int {
    case ChatLoginStatLoginTypeUnknow = 100
    case ChatLoginStatLoginTypeLogin = 200
    case ChatLoginStatLoginTypeRegist = 300
}

class ChatLoginStatUtilViewController {

}
