//
//  Barbie_worldApp.swift
//  Barbie-world
//
//  Created by sofiadinizms on 08/05/23.
//

import SwiftUI

@main
struct Barbie_worldApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
                  .environment(\.managedObjectContext, dataController.container.viewContext)
                
            }
        }
    }
}
