//
//  ContentView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var active: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(red:255.0, green: 255.0, blue: 255.0)
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack {
                        
                        Text("Você ainda não tem nenhum objetivo de aprendizagem cadastrado")
                            .bold()
                            .font(.custom("SF Pro Display", size: 32))
                            .lineLimit(2)
                        
                        Image("homeilustration")
                        
                        Text("Comece criando um novo objetivo")
                            .font(.custom("SF Pro Display", size: 20))
                            .fontWeight(.regular)
                            .opacity(0.4)
                        
                        
                        NavigationLink(destination: DetailView(), label: {
                            Image("botao")
                                .resizable()
                                .scaledToFit()
                        }).buttonStyle(PlainButtonStyle())
                        .frame(width: 170, height: 80)
                        
                        
                    }.frame(width: 643)
                    .padding(EdgeInsets(top: 65, leading: 0, bottom: 65, trailing: 0))
                    .foregroundColor(.black)
                    
                    
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
