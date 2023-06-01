//
//  CongratulationsView.swift
//  Barbie-world
//
//  Created by sofiadinizms on 31/05/23.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        VStack {
            
            Text("Parabéns! Você conseguiu!")
                .bold()
                .font(.custom("SF Pro Display", size: 32))
                .lineLimit(2)
            
            Image("success")
                .resizable()
                .scaledToFit()
                .frame(width: 643, height: 500)
            
            Text("Visite a tela inicial para ver seus objetivos concluídos")
                .font(.custom("SF Pro Display", size: 20))
                .fontWeight(.regular)
                .opacity(0.4)
            
            
            NavigationLink(destination: ContentView(), label: {
                Image("continueButton")
                    .resizable()
                    .scaledToFit()
            }).buttonStyle(PlainButtonStyle())
                .frame(width: 170, height: 80)
            
            
        }.frame(width: 643)
            .padding(EdgeInsets(top: 65, leading: 0, bottom: 65, trailing: 0))
            .foregroundColor(.black)
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
