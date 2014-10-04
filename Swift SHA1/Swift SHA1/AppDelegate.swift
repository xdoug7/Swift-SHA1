//
//  AppDelegate.swift
//  Swift SHA1
//
//  Created by Douglas Ferreira on 04/10/14.
//  Copyright (c) 2014 Douglas Ferreira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var greeting = "Hello!"
        NSLog("%@", greeting.sha1())
        
        return true
    }
}


extension String {
    func sha1() -> String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.alloc(digestLen)
        
        CC_SHA1(str!, strLen, result)
        
        var hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.destroy()
        return String(hash)
    }
}
