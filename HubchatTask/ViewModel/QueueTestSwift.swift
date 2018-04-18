//
//  QueueTestSwift.swift
//  HubchatTask
//
//  Created by Bratislav Ljubisic on 7/24/17.
//  Copyright © 2017 Bratislav Ljubisic. All rights reserved.
//

import Foundation


class QueueTestSwift {
    
    let operationQueue = OperationQueue()
    
    func testQueue(message: String) -> Bool {
        print("Testing Queue with Message: \(message)  !!!")
        let semaphore = DispatchSemaphore(value: 0)
        _ = self.selTest(completionBlock: { message in
            print("Received message:\(message)")
            //semaphore.signal()
        })
        print("Out of Queue!!!!")
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("Finished waiting for semaphore")
        return true
    }
    
    func selTest(completionBlock: @escaping (String)-> Void) -> String {
        self.operationQueue.addOperation(BlockOperation(block: {
            print("Now I am in Queue!!!!")
            completionBlock("Inside!!")
        }))
        return("Message!!!")
        
    }
}
