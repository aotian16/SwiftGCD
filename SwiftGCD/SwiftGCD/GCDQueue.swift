//
//  GCDQueue.swift
//  TestGCD
//
//  Created by 童进 on 16/5/7.
//  Copyright © 2016年 qefee. All rights reserved.
//

import Foundation

public class GCDQueue {
    
    public var queue: dispatch_queue_t!
    
    public init(queue: dispatch_queue_t) {
        self.queue = queue
    }
    
    public func async(block: dispatch_block_t) {
        dispatch_async(self.queue, block)
    }
    
    public func after(seconds: Int64, block: dispatch_block_t) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, seconds * Int64(NSEC_PER_SEC))
        dispatch_after(delayTime, self.queue, block)
    }
    
    public func apply(iterations: Int, block: (Int) -> Void) {
        dispatch_apply(iterations, self.queue, block)
    }
    
    public func once(predicate: UnsafeMutablePointer<dispatch_once_t>, block: dispatch_block_t) {
        dispatch_once(predicate, block)
    }
    
    public func suspend() {
        dispatch_suspend(self.queue)
    }
    
    public func resume() {
        dispatch_resume(self.queue)
    }
}