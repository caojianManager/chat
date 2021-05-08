//
//  ChatAssistantProtocol.swift
//  chat
//
//  Created by jian cao on 2021/4/7.
//


protocol ChatAssistantDelegate {
    
}

protocol ChatAssistantProtocol {
    
    //使用chatBaseData基础类型数据发送消息
    func sendMessageWithData(data : ChatBaseData)
}
