//
//  ChatTextData.swift
//  chat
//
//  Created by jian cao on 2021/4/6.
//

class ChatTextData: ChatBaseData {
    
    var message : String!
    
    func initWithChatMode(mode : ChatModeEnum ,targetId : String ,text : String) -> AnyObject? {
        guard let chatTextData = super.initWithChatMode(mode: mode, type: .chatContentTypeText, targetId: targetId) as? ChatTextData else {
            return nil
        }
        chatTextData.message = text
        return chatTextData
    }
}
