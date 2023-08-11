//
//  Success.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct successParameter {
    var name : String
}

extension DetailView {
    @ViewBuilder
    func Success() -> some View {
        VStack (alignment: .leading){
        Text("Indicadores de Sucesso")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .padding(.top, 60)
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0...(successParameters.count - 1), id: \.self) { i in
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 52)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        //                    .border(Color.white, width: 1)
                            .opacity(0.6)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                        
                        HStack{
                            Text("🎯")
                                .font(.largeTitle)
                                .padding(.leading, 24)
                            
                            TextField("Indicador de sucesso", text: $successParameters[i].name)
                                .textFieldStyle(.plain)
                            //                                        .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .padding(.trailing)
            }
            
            Button(action: {
                successParameters.append(successParameter(name: "Indicador de sucesso"))
            }) {
                Text("􀅼  Criar novo")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 177, height: 52)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5)
            Spacer()
            
        }
        .frame(maxWidth: 952)
    }}
}
