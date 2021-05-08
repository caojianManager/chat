//
//  CommonEnum.swift
//  chat
//
//  Created by jian cao on 2021/4/3.
//



//MARK:-聊天内容的类型
enum ChatContentTypeEnum {
    case chatContentTypeText  //纯文本消息
}

//MARK:-聊天模式
enum ChatModeEnum {
    case ChatGroupChat //群聊
    case ChatOneChat  //私聊
}

//MARK:-消息的状态
enum ChatMessageStatusEnum {
    case ChatMessageStatusSucceed
    case ChatMessageStatusSending
    case ChatMessageStatusFailed
    case ChatMessageStatusReceived
}
