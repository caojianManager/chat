//
//  UserSessionManager.swift
//  chat
//
//  Created by jian cao on 2021/3/29.
//

import Foundation
import UIKit


@objc class UserSessionManager : NSObject {
    
    var currentUser : UserBase!

    @objc static var getInstance : UserSessionManager = {
        let instance = UserSessionManager()
        return instance
    }()
    private  override init(){
    }
    
    @objc public func currentUserID() -> String {
        return currentUser.userId as String
       
    }
    
    func setCurrentUser(user : UserBase){
        currentUser = user
    }
    
//    @objc public func isLoggedIn() -> Bool{
//        if currentUser.userId.intValue > 0{
//            return true
//        }
//        return false
//    }
}
