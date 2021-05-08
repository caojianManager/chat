//
//  ZeroMQClient.swift
//  chat
//
//  Created by jian cao on 2021/4/10.
//
import SwiftyZeroMQ

class ZeroMQClient {
    
    var zeroMQHost : String!
    var context : SwiftyZeroMQ.Context!
    var requestor : SwiftyZeroMQ.Socket!
    
    init(host : String){
        zeroMQHost = host
        context = try! SwiftyZeroMQ.Context()
        requestor = try! context.socket(.request)
        try! requestor.connect(zeroMQHost)
        
    }

    
    func sendData(messageData : Data)  {
        try! requestor.send(data: messageData)

    }

    func receiveData() -> Any{
        let data = try! requestor.recv(bufferLength: 1000000, options: .none)
        return data
    }
    
    func close(){
        try! requestor.close()
    }
    
}


