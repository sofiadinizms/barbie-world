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
        VStack (alignment: .leading, spacing: 20){
            Text("Indicadores de Sucesso")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top, 60)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0...(successParameters.count - 1), id: \.self) { i in
                    HStack{
                        Text("🎯")
                            .font(.largeTitle)
                        
                        TextField("Indicador de sucesso", text: $successParameters[i].name)
                            .textFieldStyle(.plain)
                        //                                        .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onSubmit {
                                if successParameters.last?.name != "" {
                                    successParameters.append(successParameter(name: ""))
                                }
                            }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .frame(height: 52, alignment: .leading)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.25)
                    .stroke(.black.opacity(0.2), lineWidth: 0.5)
                    )
                }
                Button(action: {
                    if successParameters.last?.name != "" {
                        successParameters.append(successParameter(name: ""))
                    }
                }) {
                    Text("􀅼 Criar novo")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 0)
                        .frame(height: 52, alignment: .leading)
                        .background(.white.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.25)
                        .stroke(.black.opacity(0.2), lineWidth: 0.5)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                .onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                Spacer()
            }
            .frame(maxWidth: 952)
        }}
}
