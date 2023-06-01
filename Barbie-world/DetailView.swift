//
//  DetailView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 26/05/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center){
                OAname()
                SubOA()
                Success()
                Progress(isCompleted: true)
                CardsView()
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: FilledHomeView(), label: {
                        Image("Cancelar")
                            .resizable()
                            .scaledToFit()
                    }).buttonStyle(PlainButtonStyle())
                        .frame(width: 170, height: 80)
                        .padding(.trailing, 20)
                    
                    NavigationLink(destination: FilledHomeView(), label: {
                        Image("Criar")
                            .resizable()
                            .scaledToFit()
                    }).buttonStyle(PlainButtonStyle())
                        .frame(width: 170, height: 80)

                }
                .frame(width: 952, height: 202)
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
