//
//  EmptyHomeView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 31/05/23.
//

import SwiftUI

struct EmptyHomeView: View {
    var body: some View {
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
                Image("newOAButton")
                    .resizable()
                    .scaledToFit()
            }).buttonStyle(PlainButtonStyle())
                .frame(width: 170, height: 80)
            
            
        }.frame(width: 643, alignment: .center)
            .padding(EdgeInsets(top: 65, leading: 0, bottom: 65, trailing: 0))
            .foregroundColor(.black)
    }
}

struct EmptyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHomeView()
    }
}
