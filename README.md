# SwiftGCD
Make GCD easy to use in swift.

# install

| No.  | type     | detail                                |
| ---- | -------- | ------------------------------------- |
| 1    | carthage | `github "aotian16/SwiftGCD" ~> 1.0.0` |
| 2    | manual   | just copy *.swift to your project.    |

# use

```
		gcd.main().async { 
            print("main async")
        }
        
        gcd.global(GCDPriority.HIGH).async() {
            print("global async")
        }
        
        gcd.global().after(2) { 
            print("global after 2")
        }
        
        gcd.global().apply(10) { (index) in
            print("apply \(index) times")
        }
        
        gcd.global().once(&self.pred) { 
            print("once")
        }
        
        gcd.custom("label", type: GCDQueueType.CONCURRENT).async { 
            print("custom async")
        }
        
        gcd.custom("label", type: GCDQueueType.SERIAL).apply(10) { (index) in
            print("custom apply \(index) times")
        }
        
        let group = gcd.group()
        let global = gcd.global()
        group.notify(gcd.main()) { 
            print("group finish")
        }
        group.async(global) {
            print("group 1")
        }
        group.async(global) {
            print("group 2")
        }
        let result = group.wait(2)
        print("result = \(result)")
```

# license

MIT