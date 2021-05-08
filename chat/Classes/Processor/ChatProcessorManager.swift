//
//  ChatProcessorManager.swift
//  chat
//
//  Created by jian cao on 2021/4/8.
//

class ChatProcessorManager :NSObject{
    var chatNetWork: ChatNetWork
    
    var chatDataBase: ChatDataBase
    
    var oneChatOneMessageProcessor : ChatOneChatMessageProcessor!
    var userInfoProcessor : ChatUserInfoProcessor!
    
    
    
    static var getInstance : ChatProcessorManager = {
        let instance = ChatProcessorManager()
        return instance
    }()
    
    private override init(){

        //创建DB层次
        chatDataBase =  ChatDataBase.getInstance()
        //创建网络层
        chatNetWork = ChatNetWork.getInstance
        //创建Processor
        oneChatOneMessageProcessor = ChatOneChatMessageProcessor()
     
    }
    
    
    //MARK:-开启服务
    func start(){
        chatDataBase.loadDB()
        chatNetWork.connect()
        
        
    }
    //MARK:-关闭服务
    func stop(){
        
    }
    

    
}

extension ChatProcessorManager : ChatNetWorkDelegate {
    
}
