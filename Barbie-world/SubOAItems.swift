//
//  SubOA.swift
//  Barbie-world
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 30/05/23.
//

import SwiftUI

struct SubOAItem {
    var descript: String
    var done: Bool
}

extension DetailView {
    @ViewBuilder
    func SubOAItems() -> some View {
        LazyVGrid(columns: columns, spacing: 20) {
        ForEach(0...(items.count - 1), id: \.self) { i in
            
            HStack {
                
                Image(items[i].done ? "checkedsquare" : "square")
                    .onTapGesture {
                        items[i].done = changeValue(val: items[i].done)
                        if ((items.count) == (items.filter{ $0.done }.count) && (items.count != 0)) {
                            barColor = .theme.customGreen
                        } else {
                            barColor = .theme.customBlue
                        }
                        
                    }
                TextField("nome da oa", text: $items[i].descript)
                    .fixedSize(horizontal: false, vertical: true)
                //                                    .frame(minWidth: 0, maxWidth: .infinity)
                    .textFieldStyle(.plain)
                    .foregroundColor(.black)
                
                
            } .padding()
            //                                .frame(width: 150)
                .background(Color.white)
                .border(.black.opacity(0.1))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
            
            
        }
        
        Button(action: {
            items.append(SubOAItem(descript: "Insira o nome da task", done: false))
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
    }
    .frame(maxWidth: 952)}
}

func changeValue(val: Bool) -> Bool {
    let newVal = !val
    
    return newVal
}
