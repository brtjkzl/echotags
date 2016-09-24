//
//  UserDefaults.swift
//  Echotags
//
//  Created by bkzl on 09/06/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import Foundation

struct UserDefaults {
    private static let defaults = Foundation.UserDefaults.standard
    
    static var hasBeenLaunched: Bool {
        get {
            return defaults.bool(forKey: "hasBeenLaunched")
        }
        
        set {
            defaults.set(newValue, forKey: "hasBeenLaunched")
            defaults.synchronize()
        }
    }
    
    static var hasPassedTutorial: Bool {
        get {
            return defaults.bool(forKey: "hasPassedTutorial")
        }
        
        set {
            defaults.set(newValue, forKey: "hasPassedTutorial")
            defaults.synchronize()
        }
    }
    
    static var hasOfflineMap: Bool {
        get {
            return defaults.bool(forKey: "hasOfflineMap")
        }
        
        set {
            defaults.set(newValue, forKey: "hasOfflineMap")
            defaults.synchronize()
        }
    }

    static var hasRemovedAds: Bool {
        get {
            return defaults.bool(forKey: "hasRemovedAds")
        }

        set {
            defaults.set(newValue, forKey: "hasRemovedAds")
            defaults.synchronize()
        }
    }
}
