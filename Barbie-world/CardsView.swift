//
//  CEPRCardsView.swift
//  Barbie-world
//
//  Created by Jpsmor on 01/06/23.
//
import SwiftUI

extension DetailView {
    @ViewBuilder
    func CardsView() -> some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("CEP + R")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.top, 60)
                
                HStack(alignment: .top, spacing: 20) {
                    CardView(card: "Conteúdos", index: 0, color: Color(red: 0.204, green: 0.78, blue: 0.349).opacity(0.1))
                    CardView(card: "Experiências", index: 1, color: Color(red: 1, green: 0.584, blue: 0).opacity(0.1))
                    CardView(card: "Pessoas", index: 2, color: Color(red: 0, green: 0.478, blue: 1).opacity(0.1))
                    CardView(card: "Redes", index: 3, color: Color(red: 0.686, green: 0.322, blue: 0.871).opacity(0.1))
                }
            }
        }
    }
    
    @ViewBuilder
    func CardView(card: String, index: Int, color: Color) -> some View {
        ZStack {
            VStack {
                Text(card)
                    .font(.custom("SF Pro Display", fixedSize: 20).weight(.semibold))
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                ForEach(ceprs[index].indices, id: \.self) { i in
                    if !ceprs[index][i].isEmpty {
                        TextField("Escreva aqui", text: Binding(
                            get: { ceprs[index][i] },
                            set: { ceprs[index][i] = $0 }
                        ))
                        .font(.custom("SF Pro Display", fixedSize: 14).weight(.regular))
                        .padding()
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(color).cornerRadius(10)
                    }
                }
                
                TextField("Escreva aqui", text: $ceprsTextFields[index])
                    .font(.custom("SF Pro Display", fixedSize: 14).weight(.regular))
                    .padding()
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(color).cornerRadius(10)
                    .onSubmit {
                        addTextField(index: index)
                    }
                
                Button(action: {
                    addTextField(index: index)
                }) {
                    Label("Novo", systemImage: "plus")
                }
                .frame(maxWidth: 178, maxHeight: .leastNonzeroMagnitude, alignment: .bottomLeading)
                .padding()
                .foregroundColor(.black)
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(10)
                .onHover { inside in
                    if inside {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
                
            }
            .padding(EdgeInsets(top: 16, leading: 24, bottom: 6, trailing: 24))
            .frame(width: 226, alignment: .topLeading)
            .background(color)
            .cornerRadius(10)
        }
        
    }
    
    func addTextField(index: Int) {
        if ceprsTextFields[index] != ""{
            ceprs[index].append(ceprsTextFields[index])
            ceprsTextFields[index] = ""
        }
    }
    
}
