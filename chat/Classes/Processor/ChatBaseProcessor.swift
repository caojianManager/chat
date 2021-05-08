//
//  ChatBaseProcessor.swift
//  chat
//
//  Created by jian cao on 2021/4/25.
//



protocol ChatBaseProcessorDelegate:NSObject{
    var chatNetWork :ChatNetWork{get set}
    var chatDataBase : ChatDataBase{get set}
}

class ChatBaseProcessor: NSObject {
    var delegate : ChatBaseProcessorDelegate?
}
