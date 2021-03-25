//
//  ChatUSerDefaultUtil.swift
//  chat
//
//  Created by jian cao on 2021/3/17.
//
import UIKit



class ChatUserDefaultUtil {
    
    func saveUSerDefaultObject(object:AnyObject,key:String) -> Void {
        let defaults = UserDefaults.standard
        defaults.set(object, forKey: key)
        defaults.synchronize()
    }
    
    @objc class func getUserDefaultObject(key:String) -> AnyObject{
        let defaults = UserDefaults.standard
        let tempObject : AnyObject = defaults.object(forKey: key) as AnyObject
        return tempObject
    }
    
    func removeObjectWithKey(key:String) -> Void{
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
        
    }
}
