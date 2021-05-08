//
//  BaseData.swift
//  chat
//
//  Created by jian cao on 2021/4/3.
//
import UIKit

class ChatBaseData : NSObject {
    
    var chatContentType : ChatContentTypeEnum!
    var chatMode : ChatModeEnum!
    var header : (AnyObject & ChatDataHeaderProtocol)!
    
    override init() {
        super.init()
    }

    func initWithChatMode(mode : ChatModeEnum ,type : ChatContentTypeEnum ,targetId : String ) -> AnyObject {
        chatMode = mode
        chatContentType = type
        switch mode {
            case ChatModeEnum.ChatOneChat :
                break
            default:
                break
            }
        return self
        
    }
    
}
