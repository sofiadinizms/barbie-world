//
//  CEPRCardsView.swift
//  Barbie-world
//
//  Created by Jpsmor on 01/06/23.
//

import SwiftUI

struct CardsView: View {
    
    let cards = [("Conteúdos", Color(red: 0.204, green: 0.78, blue: 0.349).opacity(0.1)), ("Experiências", Color(red: 1, green: 0.584, blue: 0).opacity(0.1)), ("Pessoas", Color(red: 0, green: 0.478, blue: 1).opacity(0.1)), ("Redes", Color(red: 0.686, green: 0.322, blue: 0.871).opacity(0.1))]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("CEP + R")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.top, 60)
                    
                    
                
                LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 20) {
                    ForEach(cards, id: \.0) { card in
                        CardView(card: card.0, color: card.1)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let card: String
    let color: Color
    
    @State private var textFieldValue: String = ""
    @State private var textFields: [String] = []
    
    var body: some View {
        
        ZStack {
            VStack {
                
                
                Text(card)
                    .font(.custom("SF Pro Display", fixedSize: 20).weight(.semibold))
                    .padding()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                ForEach(textFields.indices, id: \.self) { index in
                    if !textFields[index].isEmpty {
                    TextField("Escreva aqui", text: Binding(
                                get: { textFields[index] },
                                set: { textFields[index] = $0 }
                            ))
                            .font(.custom("SF Pro Display", fixedSize: 14).weight(.regular))
                            .padding()
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(color).cornerRadius(10)
                    }
                }
                
                TextField("Escreva aqui", text: $textFieldValue)
                    .font(.custom("SF Pro Display", fixedSize: 14).weight(.regular))
                    .padding()
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(color).cornerRadius(10)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Button(action: {
                    addTextField()
                }) {
                    Label("Novo", systemImage: "plus")
                }
                .frame(maxWidth: 178, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
                .foregroundColor(.black)
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(10)
                
            }
            .padding(EdgeInsets(top: 16, leading: 24, bottom: 6, trailing: 24))
            .frame(width: 226, alignment: .topLeading)
            .background(color)
            .cornerRadius(10)
        }
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0, alignment: .topLeading)
    }
    
    private func addTextField() {
        textFields.append(textFieldValue)
        textFieldValue = ""
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
