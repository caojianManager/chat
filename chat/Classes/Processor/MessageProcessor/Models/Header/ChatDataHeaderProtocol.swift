//
//  ChatDataHeaderProtocol.swift
//  chat
//
//  Created by jian cao on 2021/4/3.
//

protocol ChatDataHeaderProtocol {
    
    var chatId : Int { get set}
    var userId : Int {get set}
    var nickName : String {get set}
    var lastId : Int {get set}
    var isRead : Bool {get set}
    var targetId : Int {get set}
    
//    func initWithMessageEntry(messageEntry : ChatZeroMQMessageEntry) -> AnyObject
//    func initWithDBRecord()
}
