//
//  ContentView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var hasOA: Bool = true
    
    var body: some View {
        ZStack{
            
            if hasOA{
                
                Color(.windowBackgroundColor)
                
            } else {
                
                Color(red:255.0, green: 255.0, blue: 255.0)
            }
            
            ScrollView(.vertical, showsIndicators: false){
                
                if hasOA{
                    
                    FilledHomeView()
                    
                } else {
                    
                   EmptyHomeView()
                    
                }
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

