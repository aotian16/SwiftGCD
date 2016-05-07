//
//  GCDGroup.swift
//  TestGCD
//
//  Created by 童进 on 16/5/7.
//  Copyright © 2016年 qefee. All rights reserved.
//

import Foundation

public class GCDGroup {
    
    public var group: dispatch_group_t!
    
    public init(group: dispatch_group_t) {
        self.group = group
    }
    
    public func async(queue: GCDQueue, block: dispatch_block_t) {
        queue.async(block)
    }
    
    public func notify(queue: GCDQueue, block: dispatch_block_t) {
        dispatch_group_notify(self.group, queue.queue, block)
    }
    
    public func wait(seconds: Int64) -> Int {
        let waitSeconds: Int64 = 1
        let waitTime = dispatch_time(DISPATCH_TIME_NOW, waitSeconds * Int64(NSEC_PER_SEC))
        let waitResult = dispatch_group_wait(self.group, waitTime)
        return waitResult

    }
}