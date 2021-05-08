//
//  ChatUserInfoProcessor.swift
//  chat
//
//  Created by jian cao on 2021/4/25.
//

import Foundation

class ChatUserInfoProcessor: ChatBaseProcessor {
   
    var loadingUserInfoQueue:DispatchQueue!
    var loadingUserIdArray : Array<Any>!
    
    
    override init() {
        loadingUserInfoQueue = DispatchQueue(label:  "serialQueue1")
        loadingUserIdArray = Array()
    }
    
    class func initUserInfoDB(user:UserBase){
        ChatDataBase.getInstance().loadDB()

        let zeroMqClient = ZeroMQClient(host: ZeroMQCommonHost)
        let dataStr = String(format: "{'dataType':'findRelatedPersonal','collegeNum':'%@','grade':'%@'}", arguments: [user.collegeNum,user.grade])
        guard let data = dataStr.data(using: .utf8) else {
            return

        }
        zeroMqClient.sendData(messageData: data)
        let receiveData = zeroMqClient.receiveData() as! String
        zeroMqClient.close()
        let dataArray = receiveData.components(separatedBy: ";")
        for item in dataArray{
            let userData = UserBase.getUserBase(item)
            guard let userRecord = ChatDBUserRecord(user: userData) else {
            return
            }
            ChatDataBase.getInstance().userTable.insertRecord(userRecord)

        }

        
    }
}
