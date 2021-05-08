//
//  ChatNetWork.swift
//  chat
//
//  Created by jian cao on 2021/4/7.
//

import UIKit
import Foundation
import CocoaMQTT

protocol ChatNetWorkDelegate : NSObject {
    
}


class ChatNetWork : NSObject {
    
    weak var delegate : ChatNetWorkDelegate?
    var mqttClient : MQTTClient!
    

    
    static var getInstance : ChatNetWork = {
        let instance = ChatNetWork()
        return instance
    }()
    
    private override init(){
        super.init()
        self.connect()
    }
    
    //MARK:-与MQTT服务器的连接/断连接
    
    func connect(){
        mqttClient = MQTTClient()
        mqttClient.host = MQTT_HOST
        mqttClient.port = UInt16(MQTT_PORT)
        mqttClient.userName = MQTT_USERNAME
        mqttClient.password = MQTT_PASSWORD
        mqttClient.keepAlive = UInt16(MQTT_KEEP_ALIVE)
        mqttClient.delegate = self
        mqttClient.connect()

    }

    func disconnect(){
        mqttClient.disconnect()
    }
    
    //MARK:-MQTT的订阅/解订阅
    
    func subscribeWithTopic(topicId : String ,topicLastId : Int){
     
    }
    
    func unSubscribeWithTopicId(topicId : String){
        
    }
    
    func zeroMQSendData(chatData :ChatZeroMQMessage ) -> String{
  
        let dataJson = String(format: "{'dataType':'oneChat','chatId':'%d','content':'%@','msgType':'%@','sourceId':'%@','targetId':'%@','timeStamp':'%@','type':'%@'}", arguments: [chatData.chatId,chatData.content,chatData.msgType,chatData.sourceId,chatData.targetId,chatData.timeStamp,chatData.type])
        guard let data = dataJson.data(using: .utf8) else {
            return "nil"

        }
//
        let zeroMQClient = ZeroMQClient(host: ZeroMQChatHost)
        zeroMQClient.sendData(messageData: data)
        let lastId = zeroMQClient.receiveData() as! String
        zeroMQClient.close()

        return lastId
    }

    
}

extension ChatNetWork : CocoaMQTTDelegate{
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
        print(message.string ?? "没有返回的发布Nothing")

    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("didPublishAck")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        print("didReceiveMessage")
        let data : [Substring] = (message.string?.split(separator:","))!
        print(data[0])
        print(data[1])
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
       
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("didUnsubscribeTopic")
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("正在ping")
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("正在pong")
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        
    }
    

    //正在建立连接
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
//
        print("正在建立连接")
        if ack.description == "accept" {
            let topic : String = String(format: "/uid/%@", arguments: [UserSessionManager.getInstance.currentUserID()])
            mqtt.subscribe(topic)

        }

    }
}
