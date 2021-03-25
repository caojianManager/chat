//
//  aaViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/22.
//

import UIKit
import SwiftyZeroMQ

class aaViewController: UIViewController {
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        do {
            // Define a TCP endpoint along with the text that we are going to send/recv
            let endpoint     = "tcp://127.0.0.1:5555"
            let textToBeSent = "Hello world"

            // Request socket
            let context      = try SwiftyZeroMQ.Context()
            let requestor    = try context.socket(.request)
            try requestor.connect(endpoint)

            // Reply socket
//            let replier      = try context.socket(.reply)
//            try replier.bind(endpoint)
            while true {
                // Send it without waiting and check the reply on other socket
                try requestor.send(string: textToBeSent, options: .dontWait)
                let reply = try requestor.recv()
      
//                print("\(reply)")
//                if reply == textToBeSent {
//
//                    print("\(reply)")
//                } else {
//                    print("Mismatch")
//                }
            }

            

        } catch {
            print(error)
        }

        
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
