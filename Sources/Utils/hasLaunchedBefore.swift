//
//  hasLaunchedBefore.swift
//  Noty
//
//  Created by Haneen Mahdin on 23/04/22.
//

import Foundation

func hasLauchedBefore() -> Bool {
    if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
        UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
        UserDefaults.standard.synchronize()
        
        return true
    }
    return false
}
