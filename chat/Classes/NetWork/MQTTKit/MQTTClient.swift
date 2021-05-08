//
//  MQTTKit.swift
//  chat
//
//  Created by jian cao on 2021/4/9.
//

import CocoaMQTT


class MQTTClient{

    var mqtt : CocoaMQTT!
    var clientId : String!
    var host : String!
    var port : UInt16!
    var userName : String!
    var password : String!
    var keepAlive : UInt16!
    weak var delegate : CocoaMQTTDelegate?
    

    
    func connect(){
        clientId = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientId, host: host, port: port)
        mqtt.username = userName
        mqtt.password = password
        mqtt.keepAlive = keepAlive
        mqtt.delegate = delegate
        mqtt.connect()
    }
    
    func disconnect(){
        mqtt.disconnect()
    }
    
    func subscribe(topic : String){
        mqtt.subscribe(topic)
    }
    
    func unsubscribe(topic : String){
        mqtt.unsubscribe(topic)
    }
    
}


