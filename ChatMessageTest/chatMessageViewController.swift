//
//  chatMessageViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/23.
//

import UIKit
import SwiftyZeroMQ
import CocoaMQTT

class chatMessageViewController: UIViewController {
    
    @IBOutlet weak var testButton : UIButton!
    @IBOutlet weak var textFile : UITextField!
    @IBOutlet weak var context : UILabel!
    
    var mqtt : CocoaMQTT!

    override func viewDidLoad() {
        super.viewDidLoad()
        configMqttClient()
        refreshContent()
        refreshContent()
    }

    func refreshContent(){
        context.text = textFile.text
    }

    //MARK:- 客户端向ZeroMQ服务器发送消息
    @IBAction func sendZeroMQMesg(){
        do{
            let endpoint = "tcp://127.0.0.1:5555"
            let context      = try SwiftyZeroMQ.Context()
            let requestor    = try context.socket(.request)
            try requestor.connect(endpoint)
            //
            print("---向ZeroMQ服务器发送消息----")
            try requestor.send(string: textFile.text!, options: .dontWait)
            refreshContent()
            print("---接收ZeroMQ服务器返回消息----")
            let reply = try requestor.recv()
            print(reply)
        }catch{
            print(error)
        }
    }
    
    func configMqttClient(){
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "10.211.55.3", port: 1883)
        mqtt.username = "admin"
        mqtt.password = "public"
        mqtt.keepAlive = 60
        mqtt.delegate = self
        let right =  mqtt.connect()
         print("连接结果\(right)")
    }
  

}


extension chatMessageViewController : CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
        print(message.string ?? "没有返回的发布Nothing")

    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        print("已经接受到的消息\(message.string)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        
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
        
        print("正在建立连接")
        if ack.description == "accept" {
            mqtt.subscribe("/server")

        }

    }
}

