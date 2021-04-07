//
//  C964App.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/10/21.
//

import SwiftUI

@main
struct C964App: App {
    var results: Results_Data = Results_Data()
    
    var body: some Scene {
        WindowGroup {
            StartingView().environmentObject(results)
            
        }
    }
}
