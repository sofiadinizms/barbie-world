//
//  NomeDaOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func OAName() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 952, height: 202)
                .cornerRadius(16)
            
            
            VStack(alignment: .leading){
                HStack(alignment: .bottom) {
                    Text(randomEmoji)
                        .font(.system(size: 68))
                    
                    Button(action: {
                        randomEmoji = Emojis.emoji.randomElement() ?? ""
                    }) {
                        Image("button random")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34,height:34)
                        
                    }
                    .padding(.bottom, 3)
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
                TextField("Nome da OA", text: $oaTitle)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                TextField("Descrição do objetivo de aprendizado", text: $oaSubtitle)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 26)
                
            }
            .padding(.leading, 26)
            
            
        }
        .frame(width: 952, height: 202)
        .padding(.top, 84)
        .shadow(color: Color.black.opacity(0.1), radius: 5)
    }
}
