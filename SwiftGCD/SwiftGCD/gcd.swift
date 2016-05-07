//
//  gcd.swift
//  TestGCD
//
//  Created by 童进 on 16/5/7.
//  Copyright © 2016年 qefee. All rights reserved.
//

import Foundation

public class gcd {
    
    public class func main() -> GCDQueue {
        let main = dispatch_get_main_queue()
        let queue = GCDQueue(queue: main)
        return queue
    }
    
    public class func global(priority: GCDPriority = GCDPriority.DEFAULT) -> GCDQueue {
        
        var identifier: dispatch_queue_priority_t!
        
        switch priority {
        case GCDPriority.HIGH:
            identifier = DISPATCH_QUEUE_PRIORITY_HIGH
        case GCDPriority.DEFAULT:
            identifier = DISPATCH_QUEUE_PRIORITY_DEFAULT
        case GCDPriority.LOW:
            identifier = DISPATCH_QUEUE_PRIORITY_LOW
        default:
            identifier = DISPATCH_QUEUE_PRIORITY_BACKGROUND
        }
        
        let global = dispatch_get_global_queue(identifier, 0)
        let queue = GCDQueue(queue: global)
        return queue
    }
    
    public class func globalHigh() -> GCDQueue {
        return global(GCDPriority.HIGH)
    }
    
    public class func globalDefault() -> GCDQueue {
        return global(GCDPriority.DEFAULT)
    }
    
    public class func globalLow() -> GCDQueue {
        return global(GCDPriority.LOW)
    }
    
    public class func globalBackground() -> GCDQueue {
        return global(GCDPriority.BACKGROUND)
    }
    
    public class func custom(label: String, type: GCDQueueType = GCDQueueType.CONCURRENT) -> GCDQueue {
        var attr: dispatch_queue_attr_t!
        
        switch type {
        case GCDQueueType.SERIAL:
            attr = DISPATCH_QUEUE_SERIAL
        default:
            attr = DISPATCH_QUEUE_CONCURRENT
        }
        
        let create = dispatch_queue_create(label, attr)
        let queue = GCDQueue(queue: create)
        return queue
    }
    
    public class func group() -> GCDGroup {
        let group = dispatch_group_create()
        return GCDGroup(group: group)
    }
}