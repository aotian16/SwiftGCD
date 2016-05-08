//
//  gcd.swift
//  TestGCD
//
//  Created by 童进 on 16/5/7.
//  Copyright © 2016年 qefee. All rights reserved.
//

import Foundation

public class gcd {
    
    public static var sharedMain             = gcd.main()
    public static var sharedGlobalHigh       = gcd.globalHigh()
    public static var sharedGlobalDefault    = gcd.globalDefault()
    public static var sharedGlobalLow        = gcd.globalLow()
    public static var sharedGlobalBackground = gcd.globalBackground()
    
    /**
     main queue
     
     - returns: main queue
     */
    public class func main() -> GCDQueue {
        let main = dispatch_get_main_queue()
        let queue = GCDQueue(queue: main)
        return queue
    }
    
    /**
     global queue
     
     - parameter priority: priority(default = GCDPriority.DEFAULT)
     
     - returns: global queue
     */
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
    
    /**
     global high priority queue
     
     - returns: global high priority queue
     */
    public class func globalHigh() -> GCDQueue {
        return global(GCDPriority.HIGH)
    }
    
    /**
     global default priority queue
     
     - returns: global default priority queue
     */
    public class func globalDefault() -> GCDQueue {
        return global(GCDPriority.DEFAULT)
    }
    
    /**
     global low priority queue
     
     - returns: global low priority queue
     */
    public class func globalLow() -> GCDQueue {
        return global(GCDPriority.LOW)
    }
    
    /**
     global background priority queue
     
     - returns: global background priority queue
     */
    public class func globalBackground() -> GCDQueue {
        return global(GCDPriority.BACKGROUND)
    }
    
    /**
     custom queue
     
     - parameter label: label
     - parameter type:  type (1. serial 2. concurrent)
     
     - returns: custom queue
     */
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
    
    /**
     group
     
     - returns: group
     */
    public class func group() -> GCDGroup {
        let group = dispatch_group_create()
        return GCDGroup(group: group)
    }
}