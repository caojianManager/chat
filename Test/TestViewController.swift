//
//  TestViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/22.
//

import UIKit
import CocoaMQTT


class TestViewController: UIViewController {
    
    var mqtt : CocoaMQTT!
   
    private let endpoint = "tcp://127.0.0.1:5555"

    override func viewDidLoad() {
        super.viewDidLoad()
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "10.211.55.3", port: 1883)
        mqtt.username = "admin"
        mqtt.password = "public"
        
        mqtt.willMessage = CocoaMQTTWill(topic: "/World", message: "Hello world!")
        mqtt.keepAlive = 60
        mqtt.delegate = self
        print("咋就不习惯了")
       let right =  mqtt.connect()
     
       
   
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TestClick(){
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TestViewController : CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
        print(message.string ?? "999")

    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        
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
    

    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        
        print("正在建立连接")
        if ack.description == "accept" {
                   mqtt.publish("chat", withString: "dtr")
                   mqtt.subscribe("chat")

    }

    }
}

