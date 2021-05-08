//
//  ChatOneChatMessageProcessor.swift
//  chat
//
//  Created by jian cao on 2021/4/7.
//

class ChatOneChatMessageProcessor : ChatBaseProcessor {
    
    func sendMessageWithData(data :String,targetId : String) ->Bool{
        let chatOneRecord = ChatDBOneChatRecord()
        chatOneRecord?.userId = targetId
        chatOneRecord?.isRead = false
        chatOneRecord?.data = data
        chatOneRecord?.status = false
        chatOneRecord?.time = Date().timeIntervalSince1970

        ChatDataBase.getInstance().oneChatTable.insertRecord(chatOneRecord!)

        let chatZeroMessage = ChatZeroMQMessage()
        chatZeroMessage?.chatId =  chatOneRecord?.chatId ?? 0
        chatZeroMessage?.content = chatOneRecord?.data ?? ""
        chatZeroMessage?.msgType = "text"
        chatZeroMessage?.sourceId = UserSessionManager.getInstance.currentUserID()
        chatZeroMessage?.targetId = chatOneRecord?.userId ?? "0"
        chatZeroMessage?.image = ""

        chatZeroMessage?.timeStamp = "122132"
        chatZeroMessage?.type = "1"
        
        let lastId =  ChatNetWork.getInstance.zeroMQSendData(chatData: chatZeroMessage!)
        
        chatOneRecord?.lastId = Int64(lastId) ?? 0
        if chatOneRecord?.lastId != 0{
        ChatDataBase.getInstance().oneChatTable.insertRecord(chatOneRecord!)
        }
        
     
        return false
        
    }
}
